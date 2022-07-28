[timeSeriesData{1:175}] = deal([]);
samplingRate = 1000;
[labels{1:175}] = deal('');
[keywords{1:175}] = deal('');
metadata = readtable('label.csv');
keyWordLabels = metadata.Strat;
keyWordLabels(isnan(keyWordLabels)) = 1;
timeIn = metadata.t_IN;
timeIn(isnan(timeIn)) = 1;
myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mat')); %gets all mat files in struct
idx = 1;
while idx <= length(myFiles)
    start = timeIn(idx) * samplingRate;
    finish = start + 1*samplingRate;
	baseFileName = myFiles(idx).name;
	fullFileName = fullfile(myDir,baseFileName);
	fprintf(1,'Now reading %s\n',fullFileName);
	load(fullFileName);
	labels{idx} = baseFileName;
 	tmp = LAN.data;

 	if contains(baseFileName,'IN99')
        timeSeriesData{idx} = table(tmp{:}).Var1(7,start:finish);
    elseif contains(baseFileName,'IN100')
        timeSeriesData{idx} = table(tmp{:}).Var1(16,start:finish);
    elseif contains(baseFileName,'LC26')
        timeSeriesData{idx} = table(tmp{:}).Var1(7,start:finish);
    elseif contains(baseFileName,'LC39')
        timeSeriesData{idx} = table(tmp{:}).Var1(2,start:finish);
    elseif contains(baseFileName,'LC59')
        timeSeriesData{idx} = table(tmp{:}).Var1(9,start:finish);
    elseif contains(baseFileName,'LC60')
        timeSeriesData{idx} = table(tmp{:}).Var1(10,start:finish);
    elseif contains(baseFileName,'IN114')
        timeSeriesData{idx} = table(tmp{:}).Var1(14,start:finish);
    elseif contains(baseFileName,'IN106')
        timeSeriesData{idx} = table(tmp{:}).Var1(12,start:finish);
    elseif contains(baseFileName,'IN107')
        timeSeriesData{idx} = table(tmp{:}).Var1(16,start:finish);
    elseif contains(baseFileName,'LC49')
        timeSeriesData{idx} = table(tmp{:}).Var1(13,start:finish);
	else
        timeSeriesData{idx} = table(tmp{:}).Var1(8,start:finish);
    end
    
    if keyWordLabels(idx) == 1
        keywords{idx} = 'random';
    elseif keyWordLabels(idx) == 2 
        keywords{idx} = 'serial';
	else
        keywords{idx} = 'direct';
    end
    idx = idx + 1;
end
%Save these variables out to INP_test.mat:
save('INP_test.mat','timeSeriesData','labels','keywords');
