% Initialize a new hctsa analysis using these data and the default feature
% library:
%x = randn(500,1); % A random time-series
%featVector = TS_CalculateFeatureVector(x,false); % compute the default feature vector for x
TS_Init('ThreeGroupClassifyT_END.mat');
TS_Compute;
