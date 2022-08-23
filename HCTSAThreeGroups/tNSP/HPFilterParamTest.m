function classAcc = HPFilterParamTest(timeSeriesData,keywords,pup,pdown,lag)
    % The PH Walker funcction achieved 58.03% accuracy on a simple linear
    % classifier; my goal is to write this classifier by hand.
    % step 1: compute the lag-1 autocorrelation of every timeseries
    % (feature space mapping).

    numOfTS = length(timeSeriesData);
    autoCorrData = zeros(numOfTS,1);
    for ii=1:numOfTS
         y = timeSeriesData{ii};
         N = length(y)-1;
         res = HighPassFilter(y,pup,pdown);
%          nFFT = 2^(nextpow2(N)+1);
%          F = fft(res-mean(res),nFFT);
%          F = F.*conj(F);
%          acf = ifft(F); % Wiener–Khinchin
%          acf = acf./acf(1); % Normalize
%          acf = real(acf);
%          acf = acf(1:N);
%          autoCorrData(ii) = acf(lag+1);
         acf = autocorr(double(res));
         autoCorrData(ii) = acf(1+lag);
    end
    % step 2: run discriminant analysis in the feature space.
    groupLabels = categorical(reshape(keywords,[numOfTS,1]));
    data = table(groupLabels,autoCorrData);
    mdl = fitcdiscr(data,'groupLabels','Prior','empirical',...
    'DiscrimType','linear','Weights',InverseProbWeight(groupLabels),'KFold',10);
    yTrain = groupLabels;
    yPredict = kfoldPredict(mdl);
    classLabels = categories([yPredict;yTrain]);
    classAcc = 100*mean(arrayfun(@(x) mean(yPredict(yTrain==x)==yTrain(yTrain==x)),classLabels));

    function weights = InverseProbWeight(Labels)
        classNames = unique(Labels);
        numClasses = length(classNames);
        numObs = length(Labels);
        
        weights = zeros(size(Labels));
        
        for x = 1:numClasses
	        isClass = (Labels == classNames(x));
	        weights(isClass) = numObs/sum(isClass);
        end
    end
end
