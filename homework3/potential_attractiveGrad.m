%function [gradUAttr]=potential_attractiveGrad(xEval,potential)
%Evaluate the gradient of the attractive potential $ U_ attr$ at a point  xEval.
%The gradient is given by the formula If  potential.shape is equal to  'conic',
%use $p=1$. If  potential.shape is equal to  'quadratic', use $p=2$.
function [gradUAttr]=potential_attractiveGrad(xEval,potential)
