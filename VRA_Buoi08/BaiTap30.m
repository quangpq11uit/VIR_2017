function BaiTap30()

     rootFolderTrain = fullfile('../VRA_Buoi07/DataTrain');
     category = {'0','1','2','3','4','5','6','7','8','9'};
     imdsDataTrain = imageDatastore(fullfile(rootFolderTrain, category), 'LabelSource', 'foldernames');
     
     featuresDataTrain = loadFeatures('../../VRA_Features/featuresTrain-Alex-Number.mat', 'features');
     lblDataTrain = imdsDataTrain.Labels;
     
     classifier = fitcknn(featuresDataTrain', lblDataTrain);
     
     rootFolderTest = fullfile('../VRA_Buoi07/DataTest');
     imdsDataTest = imageDatastore(fullfile(rootFolderTest, category), 'LabelSource', 'foldernames');
     
     featuresDataTest = loadFeatures('../../VRA_Features/featuresTest-Alex-Number.mat', 'features');
     lblDataTest = imdsDataTest.Labels;
     
     lblResult = predict(classifier, featuresDataTest');
     
     nResult = (lblDataTest == lblResult);
     nCount = sum(nResult);
     
     fprintf('\nSo luong mau dung: %d\n', nCount);
end