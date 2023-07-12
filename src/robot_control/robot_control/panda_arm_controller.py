#!/usr/bin/env python3

import rospy
import actionlib
from panda_robot import PandaArm
from control_msgs.msg import GripperCommandAction, GripperCommandGoal

def control_gripper(action_client, position, max_effort):
    goal = GripperCommandGoal()
    goal.command.position = position
    goal.command.max_effort = max_effort
    action_client.send_goal(goal)
    action_client.wait_for_result()
    return action_client.get_state()  # Return the result status

def main():
    rospy.init_node("panda_robot_controller")

    panda = PandaArm()
    step_size = 0.05  # in meters

    action_client = actionlib.SimpleActionClient('/franka_gripper/gripper_action', GripperCommandAction)
    action_client.wait_for_server()

    while not rospy.is_shutdown():
        command = input("Enter command (up, down, left, right, forward, back, open, close, neutral or q to quit): ")

        if command.lower() == "q":
            break

        position, orientation = panda.ee_pose()

        if command.lower() == "up":
            position[2] += step_size
        elif command.lower() == "down":
            position[2] -= step_size
        elif command.lower() == "left":
            position[1] -= step_size
        elif command.lower() == "right":
            position[1] += step_size
        elif command.lower() == "forward":
            position[0] += step_size
        elif command.lower() == "back":
            position[0] -= step_size
        elif command.lower() == "open":
            control_gripper(action_client, 0.08, 50.0)  # Open gripper
            continue
        elif command.lower() == "close":
            control_gripper(action_client, 0.0, 50.0)  # Close gripper
            continue
        elif command.lower() == "neutral":
            gripper_closed = control_gripper(action_client, 0.0, 50.0)
            if gripper_closed == actionlib.GoalStatus.SUCCEEDED:
                panda.move_to_neutral(timeout=15.0, speed=0.15)
            else:
                print("Failed to close gripper.")
            continue
        else:
            print("Invalid command. Please enter a valid command.")
            continue

        success, joint_positions = panda.inverse_kinematics(position, orientation)

        if success:
            panda.move_to_joint_position(joint_positions)
        else:
            print("Failed to compute inverse kinematics.")

if __name__ == "__main__":
    main()

