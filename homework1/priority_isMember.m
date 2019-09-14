%function [flag]=priority_isMember(pQueue,key)
%Check whether an element with a given key is in the queue or not.

%Remember that the  key argument could be a number, a vector of numbers, a
%string, or any other arbitrary type. As such, you should use the Matlab function
%isequal to check for equality between keys (this function works for arbitrary
%types of variables, run  doc isequal on the Matlab prompt for details).

function [flag]=priority_isMember(pQueue,key)
for iQueue = 1:length(pQueue)
    if isequal(pQueue(iQueue).key,key)
        flag = true;
        return
    end
end
flag = false;
end