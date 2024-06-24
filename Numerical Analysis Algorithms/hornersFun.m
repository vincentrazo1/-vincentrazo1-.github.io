function [y,z] = hornersFun(n,a,x0)
y = a(n);
z = a(n);
for j = n-1:-1:1
    y = (x0*y) + a(j);
    z = (x0*z) + y;
    y = (x0*y) + a(0);
end
end