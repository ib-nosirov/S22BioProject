N = 10;
pup = rand(1,N);
pdown = 1 - pup;
lag = 1;
for ii=1:N
    sprintf('pup: %4.2f',pup(ii))
    sprintf('pdown: %4.2f',pdown(ii))
    HPFilterParamTest(timeSeriesData,keywords,pup(ii),pdown(ii),lag)
end
HPFilterParamTest(timeSeriesData,keywords,0.6,0.4,lag)
