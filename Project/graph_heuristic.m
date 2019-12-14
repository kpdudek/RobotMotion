%function [h]=graph_heuristic(graphVector,idxX,idxGoal)
%Computes the heuristic  @x   h given by the Euclidean distance between the nodes
%with indexes  @x   idxX and  @x   idxGoal.
function [h]=graph_heuristic(graphVector,idxX,idxGoal)
iConfig = idxX;
iNeighbor = idxGoal;

xStart = graphVector(idxX).j;
xGoal = graphVector(idxGoal).j;
for iElem = 1:length(xStart)
    v0 = [0;0];
    v1 = [1;0];
    v2 = [cos(deg2rad(graphVector(iConfig).j(iElem)));sin(deg2rad(graphVector(iConfig).j(iElem)))];
    xStart(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
    v2 = [cos(deg2rad(graphVector(iNeighbor).j(iElem)));sin(deg2rad(graphVector(iNeighbor).j(iElem)))];
    xGoal(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
end

jointDiff = xStart-xGoal;
for iJoint = 1:4
    if jointDiff(iJoint) < -180
        xGoal(iJoint) = xGoal(iJoint)-360;
    elseif jointDiff(iJoint) > 180
        xGoal(iJoint) = 360-xGoal(iJoint);
    end
end

h = sqrt(sum((xStart-xGoal).^2));
end