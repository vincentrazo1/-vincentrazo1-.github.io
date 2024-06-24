% Create your function below this comment
function [t,w] = heunFun(f,y0,a,b,N)
h = (b-a)/N;
w = zeros(1,N+1);
t = zeros(1,N+1);
t = a:h:b;
t(1) = a;
w(1) = y0;
for i = 1:1:N
    w(i+1) = w(i) + (h/2)*(f(t(i),w(i))+f(t(i+1),w(i)+h*f(t(i),w(i))))
end
end


