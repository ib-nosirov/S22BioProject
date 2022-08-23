function highFreqTS = HighPassFilter(y,pup,pdown)
numSamples = length(y);
w = zeros(1,numSamples);
for ii = 2:numSamples
    if y(ii) > y(ii-1) % time series increases
        w(ii) = w(ii-1) + pup*(y(ii-1)-w(ii-1));
    else
        w(ii) = w(ii-1) + pdown*(y(ii-1)-w(ii-1));
    end
end

highFreqTS = w-y;