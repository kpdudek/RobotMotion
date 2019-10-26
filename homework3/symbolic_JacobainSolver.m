function S = symbolic_JacobainSolver()

syms t1 t2 x y a b

hat = [ 0 -1; 1 0];
r1 = [cos(t1),-sin(t1);sin(t1),cos(t1)];
r2 = [cos(t2),-sin(t2);sin(t2),cos(t2)];
peff = [x;y];
tvec = [a;b];

eqn = (hat*r1)*r2*peff + r1*(hat*r2)*peff + (hat*r1)*tvec;

S = solve(eqn,t1,t2);

disp(S)

end