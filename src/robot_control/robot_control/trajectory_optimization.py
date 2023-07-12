#!/usr/bin/env python3

import rospy
import actionlib
from panda_robot import PandaArm
from control_msgs.msg import GripperCommandAction, GripperCommandGoal
import time

def control_gripper(action_client, position, max_effort):
    goal = GripperCommandGoal()
    goal.command.position = position
    goal.command.max_effort = max_effort
    action_client.send_goal(goal)
    action_client.wait_for_result()
    return action_client.get_state()  # Return the result status

def follow_trajectory(panda, waypoints):
    for waypoint in waypoints:
        position_offset, timestamp = waypoint
        current_position, orientation = panda.ee_pose()  # Get current end effector pose
        
        position = [p + o for p, o in zip(current_position, position_offset)]  # Add the offset to the current position

        success, joint_positions = panda.inverse_kinematics(position, orientation)

        if success:
            panda.move_to_joint_position(joint_positions)
            time_to_wait = timestamp - time.time()
            if time_to_wait > 0:
                time.sleep(time_to_wait)  # Wait until it's time to move to the next waypoint
        else:
            print("Failed to compute inverse kinematics.")
            break

def main():
    rospy.init_node("panda_robot_controller")

    panda = PandaArm()

    action_client = actionlib.SimpleActionClient('/franka_gripper/gripper_action', GripperCommandAction)
    action_client.wait_for_server()

    start_time = time.time()

    waypoints = [
        ([0.1, 0.2, 0.0], start_time + 1.0),  # move left
        ([0.0, 0.2, 0.0], start_time + 2.0),  # move up
        ([0.1, -0.1, 0.0], start_time + 3.0),  # move forward
        ([0.05, -0.1, 0.0], start_time + 4.0),  # move down
        ([0.0, 0.05, 0.0], start_time + 5.0),  # move backward (right in this case, assuming initial facing direction as forward)
        # Add more waypoints as needed
    ]
    follow_trajectory(panda, waypoints)

if __name__ == "__main__":
    main()
