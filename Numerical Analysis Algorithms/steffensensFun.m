% Create your function below this comment.
function [p,iter] = steffensensFun(g, p0, tol, Nmax)
iter = 1;
while iter <= Nmax
    p1 = g(p0);
    p2 = g(p1);
    p = p0 - ((p1 - p0)^2)/(p2 - (2*p1) + p0);
    perror = abs(p-p0);
    if perror < tol
        return;
    else 
        iter = iter + 1;
        p0 = p;
    end
end
end

