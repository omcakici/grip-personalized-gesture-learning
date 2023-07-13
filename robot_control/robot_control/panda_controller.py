#!/usr/bin/env python3

import rospy
import actionlib
import curses
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

    stdscr = curses.initscr()
    curses.cbreak()
    stdscr.keypad(True)

    while not rospy.is_shutdown():
        command = stdscr.getch()  # Get keyboard input

        if command == ord('q'):
            break

        position, orientation = panda.ee_pose()

        if command == 259:  # up arrow key
            position[2] += step_size
        elif command == 258:  # down arrow key
            position[2] -= step_size
        elif command == 260:  # left arrow key
            position[1] -= step_size
        elif command == 261:  # right arrow key
            position[1] += step_size
        elif command == ord('o'):  # 'o' key for open
            control_gripper(action_client, 0.08, 50.0)  # Open gripper
            continue
        elif command == ord('c'):  # 'c' key for close
            control_gripper(action_client, 0.0, 50.0)  # Close gripper
            continue
        elif command == ord('n'): # press 'n' key for neutrla position
            gripper_closed = control_gripper(action_client, 0.0, 50.0)
            if gripper_closed == actionlib.GoalStatus.SUCCEEDED:
                panda.move_to_neutral(timeout=15.0, speed=0.15)
            else:
                print("Failed to close gripper.")
            continue
        else:
            continue

        success, joint_positions = panda.inverse_kinematics(position, orientation)

        if success:
            panda.move_to_joint_position(joint_positions)
        else:
            print("Failed to compute inverse kinematics.")

    curses.nocbreak()
    stdscr.keypad(False)
    curses.echo()
    curses.endwin()

if __name__ == "__main__":
    main()
