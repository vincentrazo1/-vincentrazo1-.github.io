function [p,iter] = fixedPointFun(g,p0,tol,Nmax)
%  FIXEDPOINTFUN 
iter = 1;
while iter <= Nmax
    p = g(p0);
    if abs(p-p0) < tol
        return;
    else
        iter = iter + 1;
        p0 = p;
    end
end
end