function testHOG(n) 
    strData = '../train-images.idx3-ubyte';
    strDataLabel = '../train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);

    img1D = imgDataTrain(:, n);
    img2D = reshape(img1D, 28, 28);
    
    subplot(1, 5, 1);
    imshow(img2D);
    
    [featureVector, visualHog] = extractHOGFeatures(img2D, 'CellSize', [2 2]);
    subplot(1, 5, 2);
    plot(visualHog);
    
    [featureVector, visualHog] = extractHOGFeatures(img2D, 'CellSize', [4 4]);
    subplot(1, 5, 3);
    plot(visualHog);
    
    [featureVector, visualHog] = extractHOGFeatures(img2D, 'CellSize', [8 8]);
    subplot(1, 5, 4);
    plot(visualHog);
    
    subplot(1, 5, 5);
    hist(featureVector);
    
end