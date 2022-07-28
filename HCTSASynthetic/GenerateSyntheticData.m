% initialize the random number generator to make the results in this example
% repeatable.
n = 100;
% make two sets of perturbed signals with different second moment; there should
% be 10 signals in each category; each signal is 100 samples long
categSamples = 10;
categNum = 2;
[timeSeriesData{1:categNum*categSamples}] = deal([]);
[labels{1:categNum*categSamples}] = deal('');
[keywords{1:categNum*categSamples}] = deal('');
% varY = a^2*varX^2 (Note: varX is by default 1)
for idx=1:categSamples
	timeSeriesData{idx} = randn(n,1);
	labels{idx} = sprintf('sample No. %s',idx);
	keywords{idx} = 'var1';
end
for idx=categSamples+1:2*categSamples
	stdev = 5;
	x1 = randn(n,1);
	x2 = stdev.*x1;
	timeSeriesData{idx} = x2;
	labels{idx} = sprintf('sample No. %s',idx);
	keywords{idx} = 'var5';
end
% Save these variables out to INP_test.mat:
save('INP_test.mat','timeSeriesData','labels','keywords');
