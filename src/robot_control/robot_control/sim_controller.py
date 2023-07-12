#!/usr/bin/env python

import numpy as np
import rospy
from os.path import join
from enum import Enum, auto
from std_msgs.msg import String
from utils.franka_simulator import FrankaSimulator

class SimController:
    FRANKA_SIM = True

    def __init__(self):
        rospy.init_node("sim_controller", anonymous=True)
        self.sign_lang_history = []
        self.simulator = FrankaSimulator() if self.FRANKA_SIM else print("NOOO FRANKA")
        self.create_subscriptions()

    def create_subscriptions(self):
        self.sign_lang_subscription = rospy.Subscriber(
            "sign_lang", String, self.sign_lang_callback
        )

    def sign_lang_callback(self, msg):
        rospy.loginfo(f"Incoming sign language: {msg.data}")
        command = msg.data  # the interpreted command from sign language
        command = command.lower()
        if (
            command == "left"
            or command == "right"
            or command == "up"
            or command == "down"
            or command == "open gripper"
            or command == "close gripper"
        ):
            if self.FRANKA_SIM:
                rospy.loginfo("YES MOVE COMMAND")
                self.simulator.move(command)

def main():
    SimController()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("Interrupted")
        exit()

if __name__ == "__main__":
    main()
