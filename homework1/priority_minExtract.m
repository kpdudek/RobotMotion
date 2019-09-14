%function [pQueue,key,cost]=priority_minExtract(pQueue)
%Extract the element with minimum cost from the queue.
function [pQueue,key,cost]=priority_minExtract(pQueue)

for iQueue = 1:length(pQueue)
    if iQueue == 1
        minCost = pQueue(iQueue).cost;
        iminCost = iQueue;
    else
        if pQueue(iQueue).cost < minCost
            minCost = pQueue(iQueue).cost;
            iminCost = iQueue;
        end
    end
end

if ~isempty(pQueue)
    key = pQueue(iminCost).key;
    cost = pQueue(iminCost).cost;
    pQueue(iminCost) = [];
else
    key = '';
    cost = '';
end

end
