close all; clear all;
load ThreeGroupClassifyT_NSP
% take the first fNum frequencies of pwelch
fNum = 65;
numOfTS = length(timeSeriesData);
X = zeros(numOfTS,fNum);
for ii=1:numOfTS
    X(ii,:) = table(pwelch(timeSeriesData{ii},128,[],128,1000)).Var1(1:fNum);
end

% build model and output prediction
% the goal is to choose training and test sets  in such a way that the
% representation of classes in each set is approximately the same.
hpartition = cvpartition(keywords,"Holdout",0.2);
% Create training set
idxTrain = training(hpartition);
XTrain =  X(idxTrain,:);
YTrain = keywords(idxTrain);
% Create test set
idxTest = test(hpartition);
XTest = X(idxTest,:);
YTest = keywords(idxTest);

Mdl = fitcecoc(XTrain,YTrain);
cvMdl = crossval(Mdl);
cvtrainError = kfoldLoss(cvMdl);
trainAccuracy = 1 - cvtrainError
testError = loss(Mdl,XTest,YTest);
testAccuracy = 1 - testError 