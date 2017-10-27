function Q7_()
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
    Mdl = fitcknn(featuresDataTrain, lblTrainAll);
        
    indexs = unique(lblTestAll(1,:));
    indexs = indexs';
    numIndex = size(indexs, 1);
    results = zeros(numIndex + 1, numIndex + 1);

    for i=1:numIndex
       results(i + 1, 1) = indexs(i);
       results(1, i + 1) = indexs(i);
    end
    
    predictResults = predict(Mdl, featuresDataTest);
    resultCount = size(predictResults, 1);
    
    for i=1:resultCount
        label = lblTestAll(:,i);
        labelIndex = label + 1;
        result = predictResults(i);
        resultIndex = result + 1;
        results(labelIndex, resultIndex) = results(labelIndex, resultIndex) + 1;
    end
    
    csvwrite('Q7*.csv', results);
    fprintf('\n Ket qua: \n');
    fprintf([repmat('%d\t', 1, size(results, 2)) '\n'], results');

end