% Create your function below this comment
function [t,w] = rk4Fun(f,y0,a,b,N)
h = (b-a)/N;
t = zeros(1,N+1);
w = zeros(1,N+1);
t(1) = a;
w(1) = y0;
for i=2:1:N+1
    k1 = h*f(t(i-1),w(i-1));
    k2 = h*f(t(i-1)+(h/2),w(i-1)+(k1/2));
    k3 = h*f(t(i-1)+(h/2),w(i-1)+(k2/2));
    k4 = h*f(t(i-1)+h,w(i-1)+k3);
    w(i) = w(i-1)+(k1+2*k2+2*k3+k4)/6;
    t(i) = a+(i-1)*h;
end

end

