function Q8(k, distance)
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
  
    Mdl = fitcknn(imgTrainAll', lblTrainAll, 'NumNeighbors', k, 'Distance', distance);
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
        
    lblResult = predict(Mdl,imgTestAll');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end