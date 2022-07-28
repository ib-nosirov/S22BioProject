% The below code assumes HCTSA.mat exists.
TS_LabelGroups('raw',{});
TS_Normalize('mixedSigmoid',[0 1])
%TS_TopFeatures('raw','classification')
TS_Classify('norm')
