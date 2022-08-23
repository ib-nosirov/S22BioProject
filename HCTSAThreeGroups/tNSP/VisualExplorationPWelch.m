close all; clear all;
load ThreeGroupClassifyT_NSP
% one trial for one mouse was missing; remove that from each vector
numOfTS = length(timeSeriesData);
%dayNumbers = [dayNumbers(1:79); dayNumbers(81:176)];
%trialNumbersEachDay = [trialNumbersEachDay(1:79); trialNumbersEachDay(81:176)];

figure(1);
count = 0;
% plot of first day
ii = 1;
jj = 0;
while ii < numOfTS && jj ~= 12
    if contains(labels{ii},'d1','IgnoreCase',true)
        count = count+1;
        subplot(3,4,count);
        pwrSpect = pwelch(timeSeriesData{ii});
        plot(abs(pwrSpect(1:10,:)));
        title(keywords{ii});
        jj = jj+1;
    end
    ii = ii+1;
end

figure(2);
count = 0;
% plot of first day
ii = 1;
jj = 0;
while ii < numOfTS && jj ~= 12
    if contains(labels{ii},'d2','IgnoreCase',true)
        count = count+1;
        subplot(3,4,count);
        pwrSpect = pwelch(timeSeriesData{ii});
        plot(abs(pwrSpect(1:10,:)));
        title(keywords{ii});
        jj = jj+1;
    end
    ii = ii+1;
end

figure(3);
count = 0;
% plot of first day
ii = 1;
jj = 0;
while ii < numOfTS && jj ~= 12
    if contains(labels{ii},'d3','IgnoreCase',true)
        count = count+1;
        subplot(3,4,count);
        pwrSpect = pwelch(timeSeriesData{ii});
        plot(abs(pwrSpect(1:10,:)));
        title(keywords{ii});
        jj = jj+1;
    end
    ii = ii+1;
end

figure(4);
count = 0;
% plot of first day
ii = 1;
jj = 0;
while ii < numOfTS && jj ~= 12
    if contains(labels{ii},'d4','IgnoreCase',true)
        count = count+1;
        subplot(3,4,count);
        pwrSpect = pwelch(timeSeriesData{ii});
        plot(abs(pwrSpect(1:10,:)));
        title(keywords{ii});
        jj = jj+1;
    end
    ii = ii+1;
end