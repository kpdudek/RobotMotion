close all; clear; clc;

load TimeData.mat

tic; % Start timer for overall execution
% Create roadmap
r1 = linspace(0,180,90);
r2 = linspace(35,80,3);
r3 = linspace(-30,30,2);
r4 = linspace(-45,45,2);
[graphVector,QFree,collision,obstacles,graphTime] = createGraph(r1,r2,r3,r4);

%%% Save graph
save SpeedImprovementTesting2.mat graphVector QFree collision obstacles

% Start timer for overall execution
time = toc;
graphTime.overall = time;

times(end+1) = graphTime;
save TimeData.mat times

%%% Get mean number of neighbors
neighborCount = 1:length(graphVector);
for iNode = 1:length(graphVector)
    neighborCount(iNode) = length(graphVector(iNode).neighbors)-1;
end
meanNeighbors = mean(neighborCount);

%%% Print stats
fprintf('Graph creation with %d nodes took %3.2f seconds\n',length(graphVector),time)
fprintf('Mean number of neighbors %3.2f\n',meanNeighbors)