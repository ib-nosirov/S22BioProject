% The below code assumes HCTSA.mat exists.
%TS_LabelGroups('raw',{});
TS_Normalize('mixedSigmoid',[0 1])
TS_TopFeatures('norm','classification')
operations = readmatrix('topFeaturesCatalog.csv');
TS_Subset('norm',operations,1,[],'HCTSA_subset.mat');
TS_Classify('HCTSA_subset.mat');
%operations = readmatrix('OperationCatalogTwoGroups.csv')
%for idx=1:length(operations)
%    opDescription = Operations(Operations.ID==operations(idx),:);
%    masterID = opDescription.MasterID;
%    masterOp = MasterOperations(MasterOperations.ID==masterID,:);
%    opLabel = masterOp.Label{1};
%    opLabel
%end