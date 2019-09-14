%function [pQueue]=priority_insert(pQueue,key,cost)
%Add an element to the queue.
function [pQueue]=priority_insert(pQueue,key,cost)
ipQueue = length(pQueue)+1;

pQueue(ipQueue).key = key;
pQueue(ipQueue).cost = cost;
end
