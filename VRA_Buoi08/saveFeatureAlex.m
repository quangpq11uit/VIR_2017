function saveFeatureAlex(strRootFolder, strFileName)
    rootFolderTrain = fullfile(strRootFolder);
    category = {'0','1','2','3','4','5','6','7','8','9'};
    imds = imageDatastore(fullfile(rootFolderTrain, category), 'LabelSource', 'foldernames');
    imds.ReadFcn = @(filename)readAndPreprocessImage(filename);
     
    net = alexnet();
    featureLayer = 'fc7';
    
    features = activations(net, imds, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
    save(strFileName, 'features');
end