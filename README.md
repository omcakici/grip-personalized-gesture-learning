# GRIP: Gesture Regulated Interface for Personalization

GRIP is an innovative system that facilitates the intuitive control of robotic arms, specifically the Franka Emika, through personalized hand gestures. Designed in response to the increasing importance of Human-Robot Interaction (HRI) in various sectors, GRIP aims to enhance user experience by allowing the creation of custom command gestures.

The effectiveness of the system was evaluated within a Gazebo simulated environment. Participants controlled a Franka Emika robotic arm to carry out specific tasks. The user experience with gesture controls was compared with traditional keyboard commands, and an assessment was made of their satisfaction and sense of control.

# Installation

This repository contains code that is designed to run on Ubuntu 20.04 and ROS Noetic. Before you can run the system, you'll need to install some dependencies and set up a catkin workspace.

## Pre-Installation

1. Ensure your system is running [Ubuntu 20.04](https://releases.ubuntu.com/focal/).
2. Install [ROS Noetic](http://wiki.ros.org/noetic/Installation/Ubuntu).
3. Install Python 3 if it isn't already installed. In Ubuntu, you can do this with the following command:
```
sudo apt-get install python3
```

## Install System Dependencies

Now, install the required Python packages using pip. In a terminal, run the following commands:

```
pip3 install tensorflow
pip3 install mediapipe
pip3 install pybullet
pip3 install qibullet
pip3 install opencv-python
pip3 install numpy
```

## Create a Catkin Workspace

After installing the system requirements, follow these steps to create a Catkin workspace:

1. Open a new terminal and create a new directory for your Catkin workspace in the home directory (e.g., "home/{username}/Workspaces/src"). Navigate into the new directory with the following commands:

```
mkdir -p ~/Workspaces/src
cd ~/
```

1. Create the workspace. Although you can use `catkin_make`, it is recommended to use `catkin build` for larger repositories as it is safer.

```
cd ~/Workspaces
catkin build
```

1. Source your new `setup.*.sh` file. You'll need to do this every time you open a new terminal, or you can add it to your bashrc to auto-source it:

```
source devel/setup.bash
echo "source ~/Workspaces/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

You now have a functional Catkin workspace in ROS Noetic! You can add or create new ROS packages in the `src` folder of your workspace. Remember to always source the `setup.bash` file in the `devel` folder before you start working with the Catkin workspace, or the ROS packages might not work correctly.

## Clone the Repository

Finally, fetch the GitHub repository into the `src` folder of your Catkin workspace using the following command:

```
cd ~/Workspaces/src
git clone git@github.com:omcakici/grip-personalized-gesture-learning.git
```

Remember to pull the repository into your `Workspaces/src` folder.

With the repository cloned and all dependencies installed, you are ready to proceed with running the system.


## System Design

GRIP system design consists of three critical components:

1. Personalized Gesture Creation
2. Gesture Recognition and Robotic Arm Control
3. Task Execution

These components sequentially build upon the previous one, creating a robust and interactive control interface. In addition, a keyboard-based control scheme for the robotic arm serves as an alternative to the gesture-based interface.

### Personalized Gesture Creation

In the initial stage, participants are shown clips illustrating the robotic arm's movements. They then create a corresponding hand gesture for each movement. These gestures are recorded using the GestureCraft+ Train & Personalized Gestures app. A simple neural network model takes this hand gesture data, represented as 42-dimensional vectors (accounting for 21 landmarks in two dimensions), and processes it through several layers to provide a personalized mapping of gestures for each individual participant.

### Gesture Recognition and Robotic Arm Control

The core of the GRIP system revolves around the recognition and interpretation of personalized gestures. The system is built around the Robot Operating System (ROS Noetic) and Python 3, facilitating the real-time translation of human hand gestures into executable instructions for the robotic arm.

### Keyboard-Based Robotic Arm Control

An alternative control scheme for the Franka Emika Panda robotic arm is also provided. This control scheme allows the user to manipulate the robotic arm using keyboard commands.

### Task Execution

In the final stage, participants use both gesture control and keyboard control to manipulate the Franka Emika Panda robotic arm. The aim is to assess the effectiveness and intuitiveness of these control methods across a series of increasingly complex tasks.

## Usage

After successful installation, users can initiate interaction with the system by providing their name and email address in the given fields of the Gesture Classifier application. Users can then create their personalized gestures and, using either the gesture-based control or the keyboard-based control, manipulate the Franka Emika Panda robotic arm to carry out specific tasks in the Gazebo simulated environment.
