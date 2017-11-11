function BaiTap32()

     rootFolderTrain = fullfile('../VRA_Buoi07/DataTrain');
     category = {'0','1','2','3','4','5','6','7','8','9'};
     imdsDataTrain = imageDatastore(fullfile(rootFolderTrain, category), 'LabelSource', 'foldernames');
     imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);
     
     net = alexnet();
     featureLayer = 'fc7';
     
     featuresDataTrain = activations(net, imdsDataTrain, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
     lblDataTrain = imdsDataTrain.Labels;
     
     classifier = fitcdiscr(featuresDataTrain, lblDataTrain);
     
     rootFolderTest = fullfile('../VRA_Buoi07/DataTest');
     imdsDataTest = imageDatastore(fullfile(rootFolderTest, category), 'LabelSource', 'foldernames');
     imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);
     
     featuresDataTest = activations(net, imdsDataTest, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
     lblDataTest = imdsDataTest.Labels;
     
     lblResult = predict(classifier, featuresDataTest);
     
     nResult = (lblDataTest == lblResult);
     nCount = sum(nResult);
     
     fprintf('\nSo luong mau dung: %d\n', nCount);
end