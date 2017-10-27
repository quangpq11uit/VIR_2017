function Q8(k, distance)
    fprintf('\n Load du lieu train');
    imgTrainAll = loadData('DatabaseofFace/imgTrainImagesAll.mat', 'imgTrainImagesAll');
    lblTrainAll = loadData('DatabaseofFace/lblTrainLabelsAll.mat', 'lblTrainLabelsAll');
      
    fprintf('\n Load du lieu test');
    imgTestAll = loadData('DatabaseofFace/imgTestImagesAll.mat', 'imgTestImagesAll');
    lblTestAll = loadData('DatabaseofFace/lblTestLabelsAll.mat', 'lblTestLabelsAll');
     %%  Extract Features
    featuresDataTrain = ExtractFeaturesPixel(imgTrainAll);
    featuresDataTest = ExtractFeaturesPixel(imgTestAll);

    %%  Build model KNN
    Mdl = fitcknn(featuresDataTrain, lblTrainAll', 'NumNeighbors', k, 'Distance', distance);
    
    lblResult = predict(Mdl, featuresDataTest);
    nResult = (lblResult == lblTestAll');
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end