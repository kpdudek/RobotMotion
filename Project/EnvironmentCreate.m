close all; clear; clc;

% Create roadmap
r1 = 0:22.5:359;
r2 = -22.5:22.5:45;
r3 = -22.5:22.5:25;
r4 = -90:90:0;
[graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4);

%%% Save graph
save finalPaperGraph graphVector QFree collision obstacles
