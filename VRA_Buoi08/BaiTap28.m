function BaiTap28(cellSize)
    strData = '../train-images.idx3-ubyte';
    strDataLabel = '../train-labels.idx1-ubyte';
    strDataTest = '../t10k-images.idx3-ubyte';
    strDataLabelTest = '../t10k-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
    [imgDataTest,lblDataTest] = loadData(strDataTest, strDataLabelTest);
    
    featureTrain_hog = ExtractFeaturesHOG(imgDataTrain, cellSize);
    featureTest_hog = ExtractFeaturesHOG(imgDataTest, cellSize);
    
    Mdl = fitcecoc(featureTrain_hog', lblDataTrain);
    lblResult = predict(Mdl, featureTest_hog');
    
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
    
    fprintf('\nSo luong mau dung: %d\n', nCount);
end