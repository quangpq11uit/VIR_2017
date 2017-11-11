function Q7_()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
  
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
        
    indexs = unique(lblTestAll(:,1));
    numIndex = size(indexs, 1);
    results = zeros(numIndex + 1, numIndex + 1);

    for i=1:numIndex
       results(i + 1, 1) = indexs(i);
       results(1, i + 1) = indexs(i);
    end
    predictResults = predict(Mdl, imgTestAll');
    resultCount = size(predictResults, 1);
    
    for i=1:resultCount
        label = lblTestAll(i);
        labelIndex = label + 2;
        result = predictResults(i);
        resultIndex = result + 2;
        results(labelIndex, resultIndex) = results(labelIndex, resultIndex) + 1;
    end
    
    csvwrite('Q7_.csv', results);
    fprintf('\n Ket qua: \n');
    fprintf([repmat('%d\t', 1, size(results, 2)) '\n'], results');

end