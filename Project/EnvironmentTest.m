close all; clear; clc;

% Create roadmap
r1 = 0:45:359;
r2 = 0:22.5:45;
r3 = 0:22.5:45;
r4 = 0:90:90;
[graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4);

%%% Save graph
save DenseTest_Reversed graphVector QFree collision obstacles
