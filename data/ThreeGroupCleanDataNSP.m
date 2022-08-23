metadata = readtable('label.csv');
timeSeriesData = {};
labels = {};
keywords = {};
keyWordLabels = metadata.Strat;
samplingRate = 1000;
timeNSP = metadata.t_NSP;
%timeNSP(isnan(timeNSP)) = 1;
myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mat')); %gets all mat files in struct
idx = 1;
while idx <= length(myFiles)
    idx = findValidIdx(timeNSP,idx,length(myFiles));
    finish = timeNSP(idx)*samplingRate;
    start = finish-1*samplingRate;
	baseFileName = myFiles(idx).name;
	fullFileName = fullfile(myDir,baseFileName);
	fprintf(1,'Now reading %s\n',fullFileName);
	load(fullFileName);
 	tmp = LAN.data;
    isValid = 0;
 	if contains(baseFileName,'IN99')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(7,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'IN100')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(16,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'LC26')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(7,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'LC39')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(2,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'LC59')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(9,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'LC60')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(10,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'IN114')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(14,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'IN106')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(12,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'IN107')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(16,start:finish),keyWordLabels(idx));
    elseif contains(baseFileName,'LC49')
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(13,start:finish),keyWordLabels(idx));
	else
        [isValid,timeSeriesData] = addToTimeSeries(timeSeriesData,table(tmp{:}).Var1(8,start:finish),keyWordLabels(idx));
    end
    
    if keyWordLabels(idx) == 1 && isValid
        keywords{end+1} = 'random';
        labels{end+1} = baseFileName;
    elseif keyWordLabels(idx) == 2 && isValid
        keywords{end+1} = 'serial';
        labels{end+1} = baseFileName;
    elseif keyWordLabels(idx) == 3 && isValid
        keywords{end+1} = 'direct';
        labels{end+1} = baseFileName;
    end
    idx = idx+1;
end
%Save these variables out to INP_test.mat:
save('INP_test.mat','timeSeriesData','labels','keywords');

function idx = findValidIdx(timeNSP,idx,numFiles)
thisSignal = timeNSP(idx);
if isnan(thisSignal) && (idx < numFiles)
    idx = idx+1;
    idx = findValidIdx(timeNSP,idx,numFiles);
end
end

function [isValid,TSData] = addToTimeSeries(TSData,thisSignal,strat)
    isValid = 0;
    if max(abs(thisSignal)) < 500 && ~isnan(strat)
        TSData{end+1} = thisSignal;
        isValid = 1;
    end
end