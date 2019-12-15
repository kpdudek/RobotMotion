# Graph Based Planning with Potential Method for the Last Mile
This was my final project for ME570, Robot Motion planning. It consists of graph construction for a 4 DOF robot arm, and then motion planning through the environment using A* to travel on the roadmap and a conic potential function to travel on/off the roadmap.

## Usage
# Scripts
A script **EnvironemntSearch.m** was written to load a roadmap and call the planner.
A script **EnvironmentCreate.m** was written to call the function createGraph(...) and save the roadmap as a .mat file

# Planners
The hybrid planners main function is graph_search_startGoal(...) which plans from an initial configuration of joint angles to a point in cartesian space using both forward and inverse kinematics.

The functions beginning with *potential_* are used for the potential planner in cartestian space. The functions beginning with *robot_potential_* use forwards kinematics to work out the end effector location in cartesian space, call the potential planner and then use inverse kinematics to pull back the cartesian gradient into joint space.

The functions beginning with *graph_* use the A* algorithm to find a path between two indicies of a provided roadmap.

The function Kinematics(...) defines the geometry of the robot in local coordinates, and then calls the KinematicMap(...) to transform them into world coordinates

The function PlotThetas(...) creates a robot, transforms the coordinates, and then plots it.
