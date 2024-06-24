function Q = quadSimp(f,a,b,n)
if mod(n,2) == 0
    h = (b-a)/n;
    Q = f(a)+f(b);
    for i=1:(n/2)-1
        x = a + 2*i*h;
        Q = Q + 2*f(x);
    end
    for i = 1:(n/2)
        x = a + ((2*i)-1)*h;
        Q = Q + 4*f(x);
    end
    Q = Q*h/3;
else
    error("Error: The number of subintervals must be even");
end