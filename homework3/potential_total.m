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

end
