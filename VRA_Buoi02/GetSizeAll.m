function GetSizeAll()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    fprintf('\n So hinh train %d', nTrainImages);
    
    nTrainLabels = size(lblTrainAll, 1);
    fprintf('\n So label train %d', nTrainLabels);
    
    nTestImages = size(imgTestAll, 2);
    fprintf('\n So hinh test %d', nTestImages);
    
    nTestLabels = size(lblTestAll, 1);
    fprintf('\n So label test %d', nTestLabels);
    
    fprintf('\n Ket thu. \n');
end