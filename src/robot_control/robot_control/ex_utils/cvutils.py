from collections import deque
import csv
import copy
import itertools
import cv2 as cv
import os
import numpy as np
import mediapipe as mp
import tensorflow as tf
from enum import Enum, auto
from .keypoint_classifier.keypoint_classifier import KeyPointClassifier
import time

"""
Implementation based on the hand-gesture-recognition-using-mediapipe
library of Kazuhito00
https://github.com/Kazuhito00/hand-gesture-recognition-using-mediapipe
with influences of kinivi from the repo
https://github.com/kinivi/hand-gesture-recognition-mediapipe, all
modularized for the task at hand.


Sign language implementation based on https://github.com/nicknochnack/ActionDetectionforSignLanguage: 
"""
VIDEO_SRC = 0
class CvUtils():
  mp_holistic = mp.solutions.holistic
  history_length = 16
  z_coord = -0.3
  z_coord_l = -0.3
  wrist_from_origin_fraction = None
  sentence = []

  def __init__(self, video_src=VIDEO_SRC):
    self.cap = cv.VideoCapture(video_src)
    self.holistic = self.mp_holistic.Holistic()
    self.load_keypoint_classifier()
    self.point_history = deque(maxlen=self.history_length)
    self.right_wrist_coords = None # later to be [x,z,y] with z being depth
    self.right_wrist_world_coords = None # later to be [x,z,y] with z being depth
    self.left_wrist_world_coords = None # later to be [x,z,y] with z being depth
    self.last_coords = None
    self.last_gesture = None
    tf.get_logger().setLevel('INFO')
    # Add this list to keep track of the recent predictions
    self.keypoint_predictions = []

  def process_stream(self):
    if not self.cap.isOpened(): return -1

    _, frame = self.cap.read()
    debug_image, results = self.mediapipe_detection(frame, self.holistic)
    
   # Hands detections
    right_fist_detected =  False
    left_fist_detected =  False

    if results.left_hand_landmarks or results.right_hand_landmarks:
      if results.right_hand_landmarks:
        handedness = 'left' # flipped
        brect = self.calc_bounding_rect(debug_image, results.right_hand_landmarks) 
        landmark_list = self.calc_landmark_list(debug_image, results.right_hand_landmarks) 
        pre_processed_landmark_list = self.pre_process_landmark(landmark_list)
        hand_sign_id = self.keypoint_classifier(pre_processed_landmark_list)
        hand_sign = self.keypoint_classifier_labels[hand_sign_id]
        self.point_history.append([0,0])
        debug_image = self.draw_bounding_rect(debug_image, brect)
        debug_image = self.draw_info_text(debug_image, brect, handedness,
                self.keypoint_classifier_labels[hand_sign_id])
        
        # Instead of adding the gesture directly to self.sentence, add it to self.keypoint_predictions
        self.keypoint_predictions.append(hand_sign)

        if hand_sign_id == 0: 
          left_fist_detected = True
      if results.left_hand_landmarks:
        handedness = 'right' # flipped
        brect = self.calc_bounding_rect(debug_image, results.left_hand_landmarks) 
        landmark_list = self.calc_landmark_list(debug_image, results.left_hand_landmarks) 
        pre_processed_landmark_list = self.pre_process_landmark(landmark_list)
        hand_sign_id = self.keypoint_classifier(pre_processed_landmark_list)
        debug_image = self.draw_bounding_rect(debug_image, brect)
        debug_image = self.draw_info_text(debug_image, brect, handedness,
                self.keypoint_classifier_labels[hand_sign_id])
        hand_sign = self.keypoint_classifier_labels[hand_sign_id]

        # Instead of adding the gesture directly to self.sentence, add it to self.keypoint_predictions
        self.keypoint_predictions.append(hand_sign)

        if hand_sign_id == 0: 
          self.point_history.append(landmark_list[0]) 
          right_fist_detected = True
          self.wrist_from_origin_fraction = \
              [(landmark_list[0][0] - debug_image.shape[1]/2.0)/(debug_image.shape[1]/2.0), 
               self.z_coord, 
                (debug_image.shape[0] - landmark_list[0][1])/debug_image.shape[0]]
 
      if results.pose_landmarks and right_fist_detected:
        self.right_wrist_coords = [
            results.pose_landmarks.landmark[15].x, 
            results.pose_landmarks.landmark[15].z,
            results.pose_landmarks.landmark[15].y,
        ]
         
        self.right_wrist_world_coords = [
            results.pose_world_landmarks.landmark[15].x, 
            results.pose_world_landmarks.landmark[15].z,
            results.pose_world_landmarks.landmark[15].y,
        ]
        self.z_coord = results.pose_world_landmarks.landmark[15].z

      if results.pose_landmarks and left_fist_detected:
        self.left_wrist_world_coords = [
            results.pose_world_landmarks.landmark[16].x, 
            results.pose_world_landmarks.landmark[16].z,
            results.pose_world_landmarks.landmark[16].y,
        ]
        self.z_coord_l = results.pose_world_landmarks.landmark[16].z

    else: self.point_history.append([0,0])
  
    if len(self.keypoint_predictions) >= 10 and len(set(self.keypoint_predictions[-10:])) == 1:
      predicted_action = self.keypoint_predictions[-1]
      if len(self.sentence) == 0 or (len(self.sentence) > 0 and self.sentence[-1] != predicted_action):
        self.sentence.append(predicted_action)

    debug_image = self.draw_point_history(debug_image, self.point_history)
   
    cv.imshow('Hello World', debug_image)

    if cv.waitKey(10) & 0xFF == ord('q'):
      return -1

    return 0

  def load_keypoint_classifier(self):
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))  # Get the directory of cv_utils.py
    self.keypoint_classifier = KeyPointClassifier(
        model_path=os.path.join(BASE_DIR, 'keypoint_classifier', 'keypoint_classifier.tflite')
    )

    keypoint_labels_file = open(
        os.path.join(BASE_DIR, 'keypoint_classifier', 'keypoint_classifier_label.csv'),
        encoding='utf-8-sig'
    )
    self.keypoint_classifier_labels = csv.reader(keypoint_labels_file)
    self.keypoint_classifier_labels = [row[0] for row in self.keypoint_classifier_labels]
    keypoint_labels_file.close()  # explicitly close the file

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
      #landmark_z = abs(landmark.z)
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

  def draw_bounding_rect(self, image, brect):
    cv.rectangle(image, (brect[0], brect[1]), (brect[2], brect[3]),
        (0, 0, 0), 1)
    return image

  def draw_info_text(self, image, brect, handedness, hand_sign_text):
      cv.rectangle(image, (brect[0], brect[1]), (brect[2], brect[1] - 22),
                   (0, 0, 0), -1)

      info_text = handedness
      if hand_sign_text != "":
        info_text = info_text + ':' + hand_sign_text
      cv.putText(image, info_text, (brect[0] + 5, brect[1] - 4),
                 cv.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1, cv.LINE_AA)

      return image

  def draw_point_history(self, image, point_history):
    for index, point in enumerate(point_history):
      if point[0] != 0 and point[1] != 0:
       self.last_coords = [point[0], self.z_coord, point[1]]
       #print(self.last_coords)
       cv.circle(image, (point[0], point[1]), 1 + int(index / 2),
                  (152, 251, 152), 2)

    return image
  
  def mediapipe_detection(self, image, model):
    image = cv.flip(image, 1)
    image = cv.cvtColor(image, cv.COLOR_BGR2RGB) # COLOR CONVERSION BGR 2 RGB
    image.flags.writeable = False                  # Image is no longer writeable
    results = model.process(image)                 # Make prediction
    image.flags.writeable = True                   # Image is now writeable
    image = cv.cvtColor(image, cv.COLOR_RGB2BGR) # COLOR COVERSION RGB 2 BGR
    return image, results

  def cv_shutdown(self):
    self.cap.release()
    cv.destroyAllWindows()