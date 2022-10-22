function classAcc = HPFilterParamTest(timeSeriesData,keywords,pup,pdown,lag)
    % The PH Walker function achieved 55.25% accuracy on a simple linear
    % classifier; my goal is to write this classifier by hand.
    % step 1: compute the lag-1 autocorrelation of every timeseries
    % (feature space mapping).

    numOfTS = length(timeSeriesData);
    autoCorrData = zeros(numOfTS,1);
    for ii=1:numOfTS
         y = normalize(timeSeriesData{ii});
         res = HighPassFilter(y,pup,pdown);
         acf = autocorr(double(res));
         autoCorrData(ii) = acf(1+lag);
    end
    % Takes in vectors
    %autoCorrData = [autoCorrData, randn(length(autoCorrData),1)];
    % Same as TS_Compute up until this point.
    % step 2: run discriminant analysis in the feature space.
    groupLabels = categorical(reshape(keywords,[numOfTS,1]));
    fnLoss = @(yTest,yPredict) 100*mean(arrayfun(@(x) mean(yPredict(yTest==x)==yTest(yTest==x)),{'direct','random','serial'}));
    fnTestStat = @(XTrain,yTrain,XTest,yTest) fnLoss(yTest,classify(XTest,XTrain,yTrain,'linear'));
    classAcc = fnTestStat(autoCorrData,groupLabels,autoCorrData,groupLabels);
end