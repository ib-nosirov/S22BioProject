% The below code assumes HCTSA.mat exists.
TS_LabelGroups('raw',{});
TS_Normalize('mixedSigmoid',[0 1])
TS_Classify()
TS_TopFeatures('classify')
