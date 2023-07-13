# GRIP: Gesture Regulated Interface for Personalization

GRIP is an innovative system that facilitates the intuitive control of robotic arms, specifically the Franka Emika, through personalized hand gestures. Designed in response to the increasing importance of Human-Robot Interaction (HRI) in various sectors, GRIP aims to enhance user experience by allowing the creation of custom command gestures.

The effectiveness of the system was evaluated within a Gazebo simulated environment. Participants controlled a Franka Emika robotic arm to carry out specific tasks. The user experience with gesture controls was compared with traditional keyboard commands, and an assessment was made of their satisfaction and sense of control.

# Installation

This repository contains code that is designed to run on Ubuntu 20.04 and ROS Noetic. Before you can run the system, you'll need to install some dependencies and set up a catkin workspace(Catkin workspace is a structured directory that allows you to organize, build, and manage your ROS packages efficiently).

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
pip3 install numpy-quaternion
```

Note: Using `sudo` with `pip3` ensures that packages are installed system-wide. If you prefer to install packages only for the current user, you can omit the `sudo` command.

## Create a Catkin Workspace

After installing the system requirements, follow these steps to create a Catkin workspace:

1. Open a new terminal and create a new directory for your Catkin workspace in the `Workspaces` directory in your home folder. Then, navigate into the newly created directory with the following commands:

```bash
mkdir -p ~/Workspaces/catkin_ws/src
cd ~/Workspaces/catkin_ws
```

2. Create the workspace. Although you can use `catkin_make`, it is recommended to use `catkin build` for larger repositories as it is safer.

```
cd ~/Workspaces/catkin_ws
catkin build
```

3. Source your new `setup.*.sh` file. You'll need to do this every time you open a new terminal, or you can add it to your bashrc to auto-source it:

```
source devel/setup.bash
echo "source ~/Workspaces/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

You now have a functional Catkin workspace in ROS Noetic! You can add or create new ROS packages in the `src` folder of your workspace. Remember to always source the `setup.bash` file in the `devel` folder before you start working with the Catkin workspace, or the ROS packages might not work correctly.

## Installing Gazebo

Gazebo is a 3D simulation software which, when used alongside ROS and the `panda_simulator` package, provides a virtual environment for the robot. To install Gazebo on your Ubuntu system, follow these steps:

1. **Add Gazebo package list to your sources list**:
Open a terminal and execute the following command:
    
    ```
    echo "deb <http://packages.osrfoundation.org/gazebo/ubuntu-stable> `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list
    ```
2. **Setup keys**
Add the necessary keys with the following command:
   
   `wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -`

3. **Update your sources:**
Update your package lists with the following command:
   
   `sudo apt-get update`
   
4. **Install Gazebo**:
Install Gazebo with this command:
  
   `sudo apt-get install gazebo11`

## Clone the Repository

Finally, fetch the GitHub repository into the `src` folder of your Catkin workspace using the following command:

```
cd ~/Workspaces/src
git clone git@github.com:omcakici/grip-personalized-gesture-learning.git
```

Remember to pull the repository into your `Workspaces/src` folder.

With the repository cloned and all dependencies installed, you are ready to proceed with running the system.

## Setup ROS and Gazebo Environment Variables

After installing ROS, Gazebo, and creating your catkin workspace, it's crucial to source them correctly in every terminal session. However, to avoid sourcing them manually, you can add the source commands to your `.bashrc` file.

The `.bashrc` file in your home directory is a script that is executed whenever you start a new terminal session. By adding commands to this file, you ensure they're run every time you open a terminal.

Follow the steps below to add the necessary lines to your `.bashrc` file:

1. Open the `.bashrc` file in a text editor. You can use nano (a command-line text editor), but feel free to use any text editor you're comfortable with. In a terminal, type:

```bash
nano ~/.bashrc
```
2. Scroll to the end of the file and add following lines:
```source /opt/ros/noetic/setup.bash
source ~/Workspaces/catkin_ws/devel/setup.bash
export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/Workspaces/catkin_ws/src/path_to_your_gazebo_models_directory
```
In the previous instruction, replace path_to_your_gazebo_models_directory with the actual path to the directory containing your Gazebo model files.

As an illustration, in my particular configuration, the command is:
`export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/home/omer/Workspaces/catkin_ws/src/grip-personalized-gesture-learning/panda_simulator/panda_gazebo/launch`
Note that the specified directory holds several launch files for the Gazebo simulation. These files are paramount, as each one initiates a unique Gazebo environment with varying settings and configurations for the Franka robotic arm. Each launch file represents a distinct world within the Gazebo simulator, offering you a versatile range of simulation conditions.

## Note on Panda Simulator

The codebase incorporates the [panda_simulator](https://github.com/justagist/panda_simulator) package, a Gazebo simulator for the Franka Emika Panda robot with a ROS interface. This simulator offers customizable low-level controllers and real-time robot state feedback similar to the actual robot when using the Franka ROS Interface package. The system dependencies and package setup for the panda_simulator are fully included when you clone this repository, eliminating the need for separate installations.

However, if you wish to install the `panda_simulator` separately, you can clone it from the original repository. Note that, during the installation, you'll need to modify the `dependencies.rosinstall` file inside the `panda_simulator` package. Change the `version` field of the `panda_moveit_config` from `melodic-devel` to `kinetic-devel` before running `./build_ws.sh` to avoid errors.

Remember, if you don't want to deal with these extra steps, simply cloning the main repository `git@github.com:omcakici/grip-personalized-gesture-learning.git` will give you a fully functioning system, including the usage of `panda_simulator`. As you already did in previous step.



## Usage of Panda Simulator

After successfully installing all the dependencies and setting up the Catkin workspace, you can launch the Gazebo simulator and other utilities like [rviz](http://wiki.ros.org/rviz/UserGuide#Install_from_debian_repository). Please refer to the [usage instructions of the panda_simulator package](https://github.com/justagist/panda_simulator#usage) for more details.

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
