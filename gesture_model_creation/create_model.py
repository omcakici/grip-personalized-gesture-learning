#!/usr/bin/env python3

import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QLabel, QLineEdit, QMessageBox
from PyQt5.QtCore import QProcess, QThread, pyqtSignal, Qt, pyqtSlot
import os

import subprocess
import csv
import copy
import argparse
import itertools
from collections import Counter
from collections import deque
from threading import Lock

from PyQt5.QtGui import QImage, QPixmap
import cv2 as cv
import numpy as np
import mediapipe as mp

from utils import CvFpsCalc
from model import KeyPointClassifier

class GestureClassifier(QThread):
    ImageUpdate = pyqtSignal(QImage)
    statusUpdate = pyqtSignal(str)
    countUpdate = pyqtSignal(int)  # replace statusUpdate with countUpdate

    def __init__(self, args):
        super(GestureClassifier, self).__init__()

        self.args = args
        self.user_email = args.email
        self.ThreadActive = True  # To control the running of thread
        self.mp_hands = mp.solutions.hands
        self.keypoint_classifier = KeyPointClassifier()
        self.lock = Lock()
        self.cvFpsCalc = CvFpsCalc(buffer_len=10)
        self.history_length = 16
        self.point_history = deque(maxlen=self.history_length)
        self.mode = 0

        self.instructions = [
            "Press 'Space bar' 15 times for left gesture",
            "Press 'Space bar' 15 times for right gesture",
            "Press 'Space bar' 15 times for up gesture",
            "Press 'Space bar' 15 times for down gesture",
            "Press 'Space bar' 15 times for open gripper gesture",
            "Press 'Space bar' 15 times for close gripper gesture"
        ]

        self.worker = None
        self.current_instruction = 0
        self.tab_presses = [0] * len(self.instructions)  # Initialize with zeros
        self.modelCreation = False
        self.modelHasBeenGenerated = False
        self.clear_csv()
        self.write_current_user()
        self.check_if_model_exists()

        self.run()

    def stop(self):
        self.ThreadActive = False
        self.cap.release()  # assuming your VideoCapture object is named as 'cap'
        self.quit()

    def resume(self):
        self.ThreadActive = True
        self.start()

    def generate_model(self): # Run the jupyter notebook to generate personalized gesture
        command = [
            "jupyter",
            "nbconvert",
            "--execute",
            "--inplace",
            "keypoint_classification.ipynb",
        ]
        try:
            subprocess.check_call(command)
            self.modelHasBeenGenerated = True
            print("Model has been generated: !!!!!")
        except subprocess.CalledProcessError as e:
            print(f"Failed to generate model: {e}")
            # do whatever you need to do in case of failure here
            self.modelHasBeenGenerated = False

    def write_current_user(self):
        print("WRITE ONTO CURRENT USER LOG")
        f = open("currentUserLog.txt", "w")
        f.write(f"{self.user_email}")
        f.close()

    def init_camera(self, cap_device, cap_width, cap_height):
        self.cap = cv.VideoCapture(cap_device)
        self.cap.set(cv.CAP_PROP_FRAME_WIDTH, cap_width)
        self.cap.set(cv.CAP_PROP_FRAME_HEIGHT, cap_height)

    def check_if_model_exists(self):
        model_name = f"{self.user_email}.tflite"
        model_directory = './model/keypoint_classifier/tflite_models'  # Replace with your path
        model_path = os.path.join(model_directory, model_name)

        if os.path.exists(model_path):
            self.modelHasBeenGenerated = True

    def clear_csv(self):
            csv_path = 'model/keypoint_classifier/keypoint.csv'
            with open(csv_path, 'w') as f:
                f.truncate(0)  # Clear the file

    def run(self):
        cap_device = self.args.device
        cap_width = self.args.width
        cap_height = self.args.height

        use_static_image_mode = self.args.use_static_image_mode
        min_detection_confidence = self.args.min_detection_confidence
        min_tracking_confidence = self.args.min_tracking_confidence

        # Camera preparation ###############################################################
        if not self.modelCreation: # Do not initialize camera if model is being created
            self.init_camera(cap_device, cap_width, cap_height)

        # Model load #############################################################
        mp_hands = mp.solutions.hands
        hands = mp_hands.Hands(
            static_image_mode=use_static_image_mode,
            max_num_hands=1,
            min_detection_confidence=min_detection_confidence,
            min_tracking_confidence=min_tracking_confidence,
        )

        if self.modelHasBeenGenerated: #After model has been generated for user, then it can grab user model for classification
            self.keypoint_classifier = KeyPointClassifier(self.user_email)

        # Read labels ###########################################################
        with open('model/keypoint_classifier/keypoint_classifier_label.csv',
                encoding='utf-8-sig') as f:
                keypoint_classifier_labels = csv.reader(f)
                keypoint_classifier_labels = [
                    row[0] for row in keypoint_classifier_labels
        ]
        print("BEFORE WHILE !!!!!!!!!!!!!!!")
        while self.ThreadActive: # Check if the thread is supposed to be running
            fps = self.cvFpsCalc.get()

            key = cv.waitKey(10)
            if key == 27:  # ESC
                break
            # number, self.mode = self.select_mode(key, self.mode)
            # Write to the dataset file

            if self.modelCreation and not self.modelHasBeenGenerated: #This happens once, while model is generating
                self.cap.release()  # Stop the camera feed
                print("------MODEL GENERATION STARTED---------")
                self.generate_model()  # Perform your backend model generation work
                self.modelCreation = False
                self.init_camera(cap_device, cap_width, cap_height) # Restart camera

            if key == 107:  # k
                print("K PRESSES LOAD MODEL INTO FILE")
                self.mode = 1
                self.current_instruction = 0
                self.countUpdate.emit(self.current_instruction)  # emit the signal
                if self.current_instruction < len(self.instructions):
                    QMessageBox.information(None, "Instructions", self.instructions[self.current_instruction])
            
            if key == 110:  # natural
                self.mode = 0

            # Read frame from camera
            ret, image = self.cap.read()

            # Check if image is valid
            if image is None:
                print("Failed to capture image")
                continue  # skip this iteration of the loop

            # Process the image and get the debug_image
            image = cv.flip(image, 1)
            debug_image = copy.deepcopy(image)

            image = cv.cvtColor(image, cv.COLOR_BGR2RGB)

            image.flags.writeable = False
            results = hands.process(image)
            image.flags.writeable = True

            # Replace the rest of the code within this function with `self.`
            #  ####################################################################
            if results.multi_hand_landmarks is not None:
                for hand_landmarks, handedness in zip(results.multi_hand_landmarks,
                                                    results.multi_handedness):
                    # Bounding box calculation
                    brect = self.calc_bounding_rect(debug_image, hand_landmarks)
                    # Landmark calculation
                    landmark_list = self.calc_landmark_list(debug_image, hand_landmarks)

                    # Conversion to relative coordinates / normalized coordinates
                    pre_processed_landmark_list = self.pre_process_landmark(
                        landmark_list)
                    
                    if key == 32 and self.mode == 1:  # space
                        self.tab_presses[self.current_instruction] += 1
                        print("Total pressed to the space", self.tab_presses[self.current_instruction])
                        self.logging_csv(self.current_instruction, self.mode, pre_processed_landmark_list) # write to CSV each time 'tab' is pressed
                        if self.tab_presses[self.current_instruction] >= 15:
                            self.current_instruction += 1
                            self.countUpdate.emit(self.current_instruction)  # emit the signal
                            if self.current_instruction < len(self.instructions):  # If there are more instructions
                                QMessageBox.information(None, "Instructions", self.instructions[self.current_instruction]) 
                                remaining = len(self.instructions) - self.current_instruction
                                print("About to emit statusUpdate signal")
                                self.statusUpdate.emit(f"Next: {self.instructions[self.current_instruction]}. {remaining} gesture(s) remaining.")
                                print("Emitted statusUpdate signal")

                            else:  # If there are no more instructions
                                QMessageBox.information(None, "Instructions", "All instructions completed. Your model is generating!")
                                self.modelCreation = True

                    # # Write to the dataset file
                    # self.logging_csv(number, self.mode, pre_processed_landmark_list)

                    # Hand sign classification
                    hand_sign_id = self.keypoint_classifier(pre_processed_landmark_list)
                    if hand_sign_id == 2:  # Point gesture
                        self.point_history.append(landmark_list[8])
                    else:
                        self.point_history.append([0, 0])

                    debug_image = self.draw_landmarks(debug_image, landmark_list)

                    if self.modelHasBeenGenerated:
                        debug_image = self.draw_info_text(
                            debug_image,
                            brect,
                            handedness,
                            keypoint_classifier_labels[hand_sign_id]
                        )
            else:
                self.point_history.append([0, 0])

            # debug_image = self.draw_info(debug_image, fps, self.mode, number)

            # Screen reflection #############################################################
            cv.imshow('Hand Gesture Recognition', debug_image)

            # Convert the image to QImage and emit it
            ConvertToQtFormat = QImage(debug_image.data, debug_image.shape[1], debug_image.shape[0], QImage.Format_RGB888)
            Pic = ConvertToQtFormat.scaled(640, 480, Qt.KeepAspectRatio)
            self.ImageUpdate.emit(Pic)

        self.cap.release()
        cv.destroyAllWindows()

    def logging_csv(self, number, mode, landmark_list):
        if mode == 1 and (0 <= number <= 5):  # change to 5 because we have 6 gestures now
            csv_path = 'model/keypoint_classifier/keypoint.csv'
            with self.lock: # add locking mechanism here
                with open(csv_path, 'a', newline="") as f:
                    writer = csv.writer(f)
                    writer.writerow([number, *landmark_list])
        return

    # def select_mode(self, key, mode):
    #     number = -1
    #     if 48 <= key <= 57:  # 0 ~ 9
    #         number = key - 48
    #     if key == 110:  # n
    #         mode = 0
    #     if key == 107:  # k
    #         mode = 1
    #     return number, mode


    def calc_bounding_rect(self, image, landmarks):
        image_width, image_height = image.shape[1], image.shape[0]

        landmark_array = np.empty((0, 2), int)

        for _, landmark in enumerate(landmarks.landmark):
            landmark_x = min(int(landmark.x * image_width), image_width - 1)
            landmark_y = min(int(landmark.y * image_height), image_height - 1)

            landmark_point = [np.array((landmark_x, landmark_y))]

            landmark_array = np.append(landmark_array, landmark_point, axis=0)

        x, y, w, h = cv.boundingRect(landmark_array)

        return [x, y, x + w, y + h]


    def calc_landmark_list(self, image, landmarks):
        image_width, image_height = image.shape[1], image.shape[0]

        landmark_point = []

        # Keypoint
        for _, landmark in enumerate(landmarks.landmark):
            landmark_x = min(int(landmark.x * image_width), image_width - 1)
            landmark_y = min(int(landmark.y * image_height), image_height - 1)
            # landmark_z = landmark.z

            landmark_point.append([landmark_x, landmark_y])

        return landmark_point


    def pre_process_landmark(self, landmark_list):
        temp_landmark_list = copy.deepcopy(landmark_list)

        # Convert to relative coordinates
        base_x, base_y = 0, 0
        for index, landmark_point in enumerate(temp_landmark_list):
            if index == 0:
                base_x, base_y = landmark_point[0], landmark_point[1]

            temp_landmark_list[index][0] = temp_landmark_list[index][0] - base_x
            temp_landmark_list[index][1] = temp_landmark_list[index][1] - base_y

        # Convert to a one-dimensional list
        temp_landmark_list = list(
            itertools.chain.from_iterable(temp_landmark_list))

        # Normalization
        max_value = max(list(map(abs, temp_landmark_list)))

        def normalize_(n):
            return n / max_value

        temp_landmark_list = list(map(normalize_, temp_landmark_list))

        return temp_landmark_list

    def draw_line(self, image, point1, point2, color_outer, color_inner, thickness_outer=6, thickness_inner=2):
        cv.line(image, tuple(point1), tuple(point2), color_outer, thickness_outer)
        cv.line(image, tuple(point1), tuple(point2), color_inner, thickness_inner)

    def draw_circle(self, image, point, color_outer, color_inner, radius, thickness_outer=-1, thickness_inner=1):
        cv.circle(image, (point[0], point[1]), radius, color_outer, thickness_outer)
        cv.circle(image, (point[0], point[1]), radius, color_inner, thickness_inner)

    def draw_landmarks(self, image, landmark_point):
        if len(landmark_point) > 0:
            finger_parts = [(i, i+1) for i in range(2, 17, 4)] + [(i, i+1, i+2) for i in range(5, 16, 4)] + [(0, 1, 2, 5, 9, 13, 17, 0)]
            for part in finger_parts:
                for i in range(len(part) - 1):
                    self.draw_line(image, landmark_point[part[i]], landmark_point[part[i+1]], (0, 0, 0), (255, 255, 255))

        for index, landmark in enumerate(landmark_point):
            self.draw_circle(image, landmark, (255, 255, 255), (0, 0, 0), 8 if index % 4 == 0 else 5)

        return image

    def draw_info_text(self, image, brect, handedness, hand_sign_text):
        cv.rectangle(image, (brect[0], brect[1]), (brect[2], brect[1] - 22),
                     (0, 0, 0), -1)

        info_text = handedness.classification[0].label[0:]
        if hand_sign_text != "":
            info_text = info_text + ':' + hand_sign_text
        cv.putText(image, info_text, (brect[0] + 5, brect[1] - 4),
                   cv.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1, cv.LINE_AA)

        return image

    def draw_info(self, image, fps, mode, number):
        cv.putText(image, "FPS:" + str(fps), (10, 30), cv.FONT_HERSHEY_SIMPLEX,
                1.0, (0, 0, 0), 4, cv.LINE_AA)
        cv.putText(image, "FPS:" + str(fps), (10, 30), cv.FONT_HERSHEY_SIMPLEX,
                1.0, (255, 255, 255), 2, cv.LINE_AA)

        mode_string = ['Logging Key Point', 'Logging Point History']
        if 1 <= mode <= 2:
            cv.putText(image, "MODE:" + mode_string[mode - 1], (10, 90),
                    cv.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1,
                    cv.LINE_AA)
            if 0 <= number <= 9:
                cv.putText(image, "NUM:" + str(number), (10, 110),
                        cv.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1,
                        cv.LINE_AA)
        return image

class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        self.title = 'Gesture Classifier'
        self.worker = None
        self.initUI()

    def initUI(self):
        self.setWindowTitle(self.title)

        vbox = QVBoxLayout()

        # Create QLabel for the image
        image_label = QLabel()
        script_dir = os.path.dirname(os.path.realpath(__file__))
        image_path = os.path.join(script_dir, 'hello.jpg')
        pixmap = QPixmap(image_path)  # load your image
        image_label.setPixmap(pixmap.scaled(500, 300, Qt.KeepAspectRatio))  # scale your image

        # Add QLabel to the layout
        vbox.addWidget(image_label)

        self.nameLabel = QLabel("Participant Name")
        self.nameField = QLineEdit()
        vbox.addWidget(self.nameLabel)
        vbox.addWidget(self.nameField)

        self.emailLabel = QLabel("Participant Email")
        self.emailField = QLineEdit()
        vbox.addWidget(self.emailLabel)
        vbox.addWidget(self.emailField)

        self.checkButton = QPushButton("Check Model", self)
        self.checkButton.clicked.connect(self.check_model)
        vbox.addWidget(self.checkButton)

        self.startButton = QPushButton("Start Gesture Classifier", self)
        self.startButton.setEnabled(False)  # Initially disabled
        self.startButton.clicked.connect(self.startGestureClassifier)
        vbox.addWidget(self.startButton)

        self.tryButton = QPushButton("Try Your Model", self)
        self.tryButton.setEnabled(False)  # Initially disabled
        self.tryButton.clicked.connect(self.tryGestureClassifier)
        vbox.addWidget(self.tryButton)
        
        self.statusLabel = QLabel("Status")  # Add this line to initialize statusLabel
        vbox.addWidget(self.statusLabel)  # Add this line to add statusLabel to the layout

        self.count = 0  # declare a counter
        self.countLabel = QLabel("Count: 0")  # create a QLabel to display the count
        vbox.addWidget(self.countLabel)  # add the label to the layout

        self.setLayout(vbox)
        print("GUI thread:", QThread.currentThread())
        # Resize the window to desired width and height
        self.resize(500, 300)
        self.show()

    def check_model(self):
        name = self.nameField.text()
        email = self.emailField.text()
        model_name = f"{email}.tflite"
        model_directory = './model/keypoint_classifier/tflite_models'  # Replace with your path
        model_path = os.path.join(model_directory, model_name)

        if os.path.exists(model_path):
            QMessageBox.information(self, "Model Check", f"Model exists for {name}.")
            self.startButton.setEnabled(False)  # Disable "Start Gesture Classifier"
            self.tryButton.setEnabled(True)  # Enable "Try Your Model"
        else:
            QMessageBox.information(self, "Model Check", f"No model exists for {name}.")
            self.startButton.setEnabled(True)  # Enable "Start Gesture Classifier"
            self.tryButton.setEnabled(False)  # Disable "Try Your Model"

    def startGestureClassifier(self):
        self.startButton.setEnabled(False)
        name = self.nameField.text()
        email = self.emailField.text()

        QMessageBox.information(self, "Gesture Classifier", f"Starting Gesture Classifier for {name} ({email}).")

        args = self.get_args()
        args.email = email
        self.worker = GestureClassifier(args)
        self.worker.ImageUpdate.connect(self.ImageUpdateSlot)
        self.worker.statusUpdate.connect(self.updateStatusLabel, Qt.DirectConnection)  # Moved here
        self.worker.countUpdate.connect(self.updateCountLabel, Qt.DirectConnection)  # connect the signal to a slot
        self.worker.start()
       
    @pyqtSlot(str)
    def updateStatusLabel(self, status_text):
        print("updateStatusLabel thread:", QThread.currentThread())
        print("---------------UPDATE STATUS LABEL--------------")
        print("--------Status text: ", status_text)
        self.statusLabel.setText(status_text)

    @pyqtSlot(int)
    def updateCountLabel(self, count):
        
        self.countLabel.setText(f"Count: {count}")  # update the QLabel text
        print("THATS IT BABY!!! YOU COUNTED")
    
    def tryGestureClassifier(self):
        name = self.nameField.text()
        email = self.emailField.text()

        QMessageBox.information(self, "Gesture Classifier", f"Trying Your Model for {name} ({email}).")
    
        args = self.get_args()
        args.email = email
        self.worker = GestureClassifier(args)
        self.worker.ImageUpdate.connect(self.ImageUpdateSlot)
        self.worker.statusUpdate.connect(self.updateStatusLabel, Qt.DirectConnection)  # Moved here
        self.worker.start()
        # Perform operations with the existing model
        # ...

    def get_args(self):
        parser = argparse.ArgumentParser()

        parser.add_argument("--email", help="Email of the user")
        parser.add_argument("--device", type=int, default=0)
        parser.add_argument("--width", help='cap width', type=int, default=960)
        parser.add_argument("--height", help='cap height', type=int, default=540)

        parser.add_argument('--use_static_image_mode', action='store_true')
        parser.add_argument("--min_detection_confidence",
                            help='min_detection_confidence',
                            type=float,
                            default=0.7)
        parser.add_argument("--min_tracking_confidence",
                            help='min_tracking_confidence',
                            type=int,
                            default=0.5)

        args = parser.parse_args()

        return args

    def ImageUpdateSlot(self, Image):
        self.FeedLabel.setPixmap(QPixmap.fromImage(Image))


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = MyApp()
    sys.exit(app.exec_())