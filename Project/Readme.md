# Graph Based Planning with Potential Method for the Last Mile
This was my final project for ME570, Robot Motion planning. It consists of graph construction for a 4 DOF robot arm, and then motion planning through the environment using A* to travel on the roadmap and a conic potential function to travel on/off the roadmap.

## Usage
The planners main function is graph_search_startGoal(...) which plans from an initial configuration of joint angles to a point in cartesian space using both forward and inverse kinematics.

A script EnvironemntSearch.m was written to load a roadmap and call the planner.

A script EnvironmentCreate.m was written to call the function createGraph(...) and save the roadmap as a .mat file
