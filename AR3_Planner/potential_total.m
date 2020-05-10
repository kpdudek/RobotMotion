%function [U]=potential_total(xEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  potential.repulsiveWeight
function [U_val]=potential_total(xEval,obstacles,potential)

[~,world_size] = size(obstacles); % check the size of the world for iteration
U_val = potential_attractive(xEval,potential); % initialize U as the attractive potential

for iworld_sphere = 1:world_size %iterate through each obstacle for repulsive potential
    U_val = U_val+potential.repulsiveWeight*potential_repulsiveSphere(xEval,obstacles(iworld_sphere));
end
