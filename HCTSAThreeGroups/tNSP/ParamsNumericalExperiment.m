N = 10;
pup = rand(1,N);
pdown = 1-pup;
lag = 1;
for ii=1:N
Copy_of_HPFilterParamTest(timeSeriesData,keywords,pup(ii),pdown(ii),lag)
end
% the parameters don't seem to make a difference.
%for ii=1:N
%    HPFilterParamTest(timeSeriesData,keywords,pup(ii),pdown(ii),lag)
%end