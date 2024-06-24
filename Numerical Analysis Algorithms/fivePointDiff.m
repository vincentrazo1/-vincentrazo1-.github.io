function  df = fivePointDiff(f,h)

% Initialize the output vector and make sure the first and last two values of df are NaN.
df = zeros(size(f));
df(1:2) = NaN;
df(end-1:end) = NaN;

% Compute the 5 point centered finite difference vector df on the interior points.
% NaN at first two and last two positions (undefined).
n = length(df)-2;
for i=3:n
    df(i) = (f(i-2))-(8*f(i-1))+(8*f(i+1))-(f(i+2));
    df(i) = df(i)/(12*h);
end

end