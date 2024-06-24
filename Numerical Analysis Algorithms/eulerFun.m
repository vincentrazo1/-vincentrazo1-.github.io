function [t,w] = eulerFun(f,y0,a,b,N)
h = (b-a)/N;
t = zeros(1,N+1);
w = zeros(1,N+1);
t = a:h:b;
w(1) = y0;
for i=1:1:N
    w(i+1) = w(i) + h*f(t(i),w(i));
end
end