function [p,iter] = newtonsFun(f,fp,p0,tol,Nmax)
%  NEWTONSFUN 
iter = 1;
while iter <= Nmax
    p = p0 - f(p0)/fp(p0);
    if abs(p-p0) < tol
        return;
    else
        iter = iter + 1;
        p0 = p;
    end
end
end