close all; clear; clc;

tic;
% Create roadmap
r1 = linspace(0,180,4);
r2 = linspace(40,90,2);
r3 = linspace(-30,0,1);
r4 = linspace(-45,45,1);
[graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4);

%%% Save graph
save finalPaperGraph_SIMPLE graphVector QFree collision obstacles

time = toc;


neighborCount = 1:length(graphVector);
for iNode = 1:length(graphVector)
    neighborCount(iNode) = length(graphVector(iNode).neighbors);
end

meanNeighbors = mean(neighborCount);

fprintf('Graph creation with %d nodes took %3.2f seconds\n',length(graphVector),time)
fprintf('Mean number of neighbors %3.2f\n',meanNeighbors)