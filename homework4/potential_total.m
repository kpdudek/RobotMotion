%function [U]=potential_total(xEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  potential.repulsiveWeight
function [U]=potential_total(xEval,world,potential)

Uattr = potential_attractive(xEval,potential);
U = Uattr;
for iRep = 1:length(world)
    Urep = potential_repulsiveSphere(xEval,world(iRep));
    U = U + (potential.repulsiveWeight * Urep);
end

% if the point is inside a sphere, the repulsive force will be infinity. We
% want a binary condition: is it in a sphere or not.
% false if it is inside a sphere, meaning it is not a valid coordinate for
% the graph
if U ~= Inf
    U = true;
else
    U = false;
end

end
