close all; clear all;
load ThreeGroupClassifyT_NSP

function classAcc = CustomHP_Fun(timeSeriesData,keyword,)
    % The PH Walker function achieved 55.25% accuracy on a simple linear
    % classifier; my goal is to write this classifier by hand.
    % step 1: compute the lag-1 autocorrelation of every timeseries
    % (feature space mapping).

    numOfTS = length(timeSeriesData);
    autoCorrData = zeros(numOfTS,1);
    for ii=1:numOfTS
         y = normalize(timeSeriesData{ii});
         pwelchOutput = pwelch(y);
         acf = autocorr(double(pwelchOutput));
         autoCorrData(ii) = acf(1+lag);
    end
    % evaluate accuracy.
    groupLabels = categorical(reshape(keywords,[numOfTS,1]));
    fnLoss = @(yTest,yPredict) 100*mean(arrayfun(...
            @(x) mean(yPredict(yTest==x)==yTest(yTest==x)),...
            {'direct','random','serial'}));
    fnTestStat = @(XTrain,yTrain,XTest,yTest)...
                fnLoss(yTest,classify(XTest,XTrain,yTrain,'linear'));
    classAcc = fnTestStat(autoCorrData,groupLabels,autoCorrData,groupLabels);
end

N = 10;
lag = 1:N;
CustomHP_Fun(timeSeriesData,keywords,)
%outputCell = cell(N,N,N,4);
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
%HPFilterParamTest(timeSeriesData,keywords,0.5,0.3,1)


% the best results: pup = 0.5,0.6, pdown = .3, lag = 1;