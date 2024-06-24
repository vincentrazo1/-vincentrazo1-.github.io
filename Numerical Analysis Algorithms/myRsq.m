function Rsquared = myRsq(y,yy)
    y_mean = mean(y);

    SST = sum((y-y_mean).^2);
    SSE = sum((y-yy).^2);

    Rsquared = 1 - (SSE/SST);
end