#!/usr/bin/env python3

import rospy
import actionlib
from panda_robot import PandaArm
from control_msgs.msg import GripperCommandAction, GripperCommandGoal

class FrankaSimulator:
    def __init__(self):
        # rospy.init_node("panda_robot_controller")
        self.panda = PandaArm()
        self.step_size = 0.05  # in meters
        self.action_client = actionlib.SimpleActionClient(
            "/franka_gripper/gripper_action", GripperCommandAction
        )
        self.action_client.wait_for_server()

    def control_gripper(self, position, max_effort):
        goal = GripperCommandGoal()
        goal.command.position = position
        goal.command.max_effort = max_effort
        self.action_client.send_goal(goal)
        self.action_client.wait_for_result()
        return self.action_client.get_state()  # Return the result status

    def move(self, command):
        if command == "q":
            return
        position, orientation = self.panda.ee_pose()

        print(f"command: {command}")

        if command.lower() == "up":
            position[2] += self.step_size
        elif command.lower() == "down":
            position[2] -= self.step_size
        elif command.lower() == "left":
            position[1] -= self.step_size
        elif command.lower() == "right":
            position[1] += self.step_size
        elif command.lower() == "open gripper":
            self.control_gripper(0.08, 50.0)  # Open gripper
            return
        elif command.lower() == "close gripper":
            self.control_gripper(0.0, 50.0)  # Close gripper
            return
        else:
            print("Invalid command. Please enter a valid command.")
            return

        success, joint_positions = self.panda.inverse_kinematics(position, orientation)

        if success:
            self.panda.move_to_joint_position(joint_positions)
        else:
            print("Failed to compute inverse kinematics.")

