function BaiTap015(k, cellSize)
    %% Load Data
    strData = '../train-images.idx3-ubyte';
    strDataLabel = '../train-labels.idx1-ubyte';
    strDataTest = '../t10k-images.idx3-ubyte';
    strDataLabelTest = '../t10k-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
    [imgDataTest,lblDataTest] = loadData(strDataTest, strDataLabelTest);

     %%  Extract Features
    featuresDataTrain = ExtractFeaturesHOG(imgDataTrain, cellSize);
    featuresDataTest = ExtractFeaturesHOG(imgDataTest, cellSize);
    %%  Build model KNN
    Mdl = fitcknn(featuresDataTrain', lblDataTrain, 'NumNeighbors', k);
    
    lblResult = predict(Mdl,featuresDataTest');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end