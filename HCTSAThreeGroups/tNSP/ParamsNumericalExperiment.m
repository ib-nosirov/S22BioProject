N = 10;
pup = rand(1,N);
pdown = 1-pup;
lag = 1;
HPFilterParamTest(timeSeriesData,keywords,0.5,0.1,lag)
% the parameters don't seem to make a difference.
%for ii=1:N
%    HPFilterParamTest(timeSeriesData,keywords,pup(ii),pdown(ii),lag)
%end