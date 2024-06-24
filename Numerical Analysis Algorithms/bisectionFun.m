function [r,i] = bisectionFun(f,a,b,tol,Nmax)
%  BISECTIONFUN Brief summary of this function.
% 
% Detailed explanation of this function.
i = 1;
FA = f(a);
while i < Nmax
    r = (a + b)/2;
    FR = f(r);
    if abs(FR) < tol
        return
    else
        i = i + 1;
        if FA * FR > 0
            a = r;
            FA = FR;
        else 
            b = r;
        end
    end
end