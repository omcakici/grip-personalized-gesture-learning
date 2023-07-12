# GRIP: Gesture Regulated Interface for Personalization

GRIP is an innovative system that facilitates the intuitive control of robotic arms, specifically the Franka Emika, through personalized hand gestures. Designed in response to the increasing importance of Human-Robot Interaction (HRI) in various sectors, GRIP aims to enhance user experience by allowing the creation of custom command gestures.

The effectiveness of the system was evaluated within a Gazebo simulated environment. Participants controlled a Franka Emika robotic arm to carry out specific tasks. The user experience with gesture controls was compared with traditional keyboard commands, and an assessment was made of their satisfaction and sense of control.

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

## Installation

*This section will detail the installation instructions.*

## Usage

After successful installation, users can initiate interaction with the system by providing their name and email address in the given fields of the Gesture Classifier application. Users can then create their personalized gestures and, using either the gesture-based control or the keyboard-based control, manipulate the Franka Emika Panda robotic arm to carry out specific tasks in the Gazebo simulated environment.
