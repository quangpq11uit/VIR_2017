function Q7_all()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
  
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
        
    indexs = unique(lblTestAll(:,1));
    numIndex = size(indexs, 1);
    results = zeros(numIndex, 2);

    for i=1:numIndex
       results(i, 1) = indexs(i);
    end
    
    predictResults = predict(Mdl, imgTestAll');
    resultCount = size(predictResults, 1);

    for i=1:resultCount
        label = lblTestAll(i);
        labelIndex = label + 1;
        if(predictResults(i) ~= label)
           results(labelIndex, 2) = results(labelIndex, 2) + 1;
           fprintf('\n Hinh thu %d sai, label %d, tong so %d', i, label, results(labelIndex, 2));
        end
    end
    
    csvwrite('Q7.csv', results);
    fprintf('\n Ket qua: \n');
    fprintf([repmat('%d\t', 1, size(results, 2)) '\n'], results');

end