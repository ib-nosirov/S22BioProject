close all; clear all;
load INP_test
dayNumbers = reshape(repmat(mod((1:44) - 1,4) + 1,4,1),[176 1]);
trialNumbersEachDay = mod((1:176)' - 1,4) + 1;
% one trial for one mouse was missing; remove that from each vector
dayNumbers = [dayNumbers(1:79); dayNumbers(81:176)];
trialNumbersEachDay = [trialNumbersEachDay(1:79); trialNumbersEachDay(81:176)];
 
figure(1);
count = 0;
% plot first trial of first day
for ii = 1:175
    if dayNumbers(ii) == 1 && trialNumbersEachDay(ii) == 1
        count = count+1;
        subplot(3,4,count);
        plot(timeSeriesData{ii});
        title(keywords{ii});
    end
end
 
figure(2);
count = 0;
% plot second trial of second day
for ii = 1:175
    if dayNumbers(ii) == 2 && trialNumbersEachDay(ii) == 2
        count = count+1;
        subplot(3,4,count);
        plot(timeSeriesData{ii});
        title(keywords{ii});
    end
end
 
figure(3);
count = 0;
% plot third trial of third day
for ii = 1:175
    if dayNumbers(ii) == 3 && trialNumbersEachDay(ii) == 3
        count = count+1;
        subplot(3,4,count);
        plot(timeSeriesData{ii});
        title(keywords{ii});
    end
end
 
figure(4);
count = 0;
% plot THIRD trial of FOURTH day
for ii = 1:175
    if dayNumbers(ii) == 4 && trialNumbersEachDay(ii) == 3
        count = count+1;
        subplot(3,4,count);
        plot(timeSeriesData{ii});
        title(keywords{ii});
    end
end
 
figure(5);
count = 0;
% plot all trials for mouse 1
for ii = 1:16
    count = count+1;
    subplot(4,4,count);
    plot(timeSeriesData{ii});
    title(keywords{ii});
end
 
figure(6);
count = 0;
% plot all trials for mouse 2
for ii = 17:32
    count = count+1;
    subplot(4,4,count);
    plot(timeSeriesData{ii});
    title(keywords{ii});
end