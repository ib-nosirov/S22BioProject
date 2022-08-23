% Done
[timeSeriesData{1:175}] = deal([]);
samplingRate = 1000;
[labels{1:175}] = deal('');
[keywords{1:175}] = deal('');
metadata = readtable('label.csv');
keyWordLabels = metadata.SUCC;
timeEnd = metadata.t_END;
%timeEnd(isnan(timeEnd)) = ;
myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mat')); %gets all mat files in struct
idx = 1;
while idx <= length(myFiles)
    % 1 second before escape
    %finish = (timeEnd(idx)-1) * samplingRate;
    %start = finish - 1*samplingRate;
	baseFileName = myFiles(idx).name;
	fullFileName = fullfile(myDir, baseFileName);
	fprintf(1, 'Now reading %s\n', fullFileName);
	load(fullFileName);
	labels{idx} = baseFileName;
 	tmp = LAN.data;

 	if contains(baseFileName,"IN99")
        tmp = table(tmp{:}).Var1(7,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"IN100")
        tmp = table(tmp{:}).Var1(16,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"LC26")
        tmp = table(tmp{:}).Var1(7,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"LC39")
        tmp = table(tmp{:}).Var1(2,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"LC59")
        tmp = table(tmp{:}).Var1(9,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"LC60")
        tmp = table(tmp{:}).Var1(10,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"IN114")
        tmp = table(tmp{:}).Var1(14,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"IN106")
        tmp = table(tmp{:}).Var1(12,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"IN107")
        tmp = table(tmp{:}).Var1(16,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    elseif contains(baseFileName,"LC49")
        tmp = table(tmp{:}).Var1(13,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    else
        tmp = table(tmp{:}).Var1(8,:);
        timeSeriesData{idx} = tmp(:,length(tmp)-samplingRate:end);
    end
    
    if keyWordLabels(idx) == 1
        keywords{idx} = 'succ';
    else
        keywords{idx} = 'fail';
    end
    idx = idx + 1;
end
% Save these variables out to INP_test.mat:
save('INP_test.mat','timeSeriesData','labels','keywords');
