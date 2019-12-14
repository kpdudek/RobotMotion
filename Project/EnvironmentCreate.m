close all; clear; clc;

tic;
% Create roadmap
r1 = linspace(0,180,6);
r2 = linspace(10,60,3);
r3 = linspace(0,60,3);
r4 = linspace(20,45,1);
[graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4);

%%% Save graph
save finalPaperGraph3 graphVector QFree collision obstacles

time = toc;


neighborCount = 1:length(graphVector);
for iNode = 1:length(graphVector)
    neighborCount(iNode) = length(graphVector(iNode).neighbors);
end

meanNeighbors = mean(neighborCount);

fprintf('Graph creation with %d nodes took %3.2f seconds\n',length(graphVector),time)