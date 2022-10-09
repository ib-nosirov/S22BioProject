N = 10;
pup = linspace(0.1,1,N);
pdown = 1 - pup;
lag = 1:N;
outputCell = cell(N,N,N,4);
% for ii=1:length(pup)
%     for jj=1:length(pdown)
%         for kk=1:length(lag)
%             outputCell{ii,jj,kk,1} = HPFilterParamTest(timeSeriesData,keywords,...
%                 pup(ii),pdown(jj),lag(kk));
%             outputCell{ii,jj,kk,2} = pup(ii);
%             outputCell{ii,jj,kk,3} = pdown(jj);
%             outputCell{ii,jj,kk,4} = lag(kk);
%         end
%     end
% end
%keyboard
%sprintf('max: %4.2f',max(cell2mat(outputCell(:,:,:,1))),' pup: %4.2f',);
% sprintf('pup: %4.2f',);
% sprintf('pdown: %4.2f',pdown(jj));
% sprintf('lag: %4.2f',lag(kk));
HPFilterParamTest(timeSeriesData,keywords,0.6,0.3,1)
HPFilterParamTest(timeSeriesData,keywords,0.5,0.3,1)


% the best results: pup = 0.5,0.6, pdown = .3, lag = 1;
