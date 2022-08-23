% The below code assumes HCTSA.mat exists.
TS_LabelGroups('raw',{});
TS_Normalize('mixedSigmoid',[0 1])
TS_TopFeatures('norm','classification')
TS_Classify('norm')
%operations = readmatrix('OperationCatalogTwoGroups.csv')
%for idx=1:length(operations)
%    opDescription = Operations(Operations.ID==operations(idx),:);
%    masterID = opDescription.MasterID;
%    masterOp = MasterOperations(MasterOperations.ID==masterID,:);
%    opLabel = masterOp.Label{1};
%    opLabel
%end