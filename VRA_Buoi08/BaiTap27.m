function BaiTap27()
    strData = '../train-images.idx3-ubyte';
    strDataLabel = '../train-labels.idx1-ubyte';
    strDataTest = '../t10k-images.idx3-ubyte';
    strDataLabelTest = '../t10k-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
    [imgDataTest,lblDataTest] = loadData(strDataTest, strDataLabelTest);
    
    featureTrain_hist = ExtractFeaturesHistogram(imgDataTrain);
    featureTest_hist = ExtractFeaturesHistogram(imgDataTest);
    
    Mdl = fitcecoc(featureTrain_hist', lblDataTrain);
    lblResult = predict(Mdl, featureTest_hist');
    
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
    
    fprintf('\nSo luong mau dung: %d\n', nCount);
end