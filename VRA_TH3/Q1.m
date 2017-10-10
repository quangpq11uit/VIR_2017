function Q1(n)
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    fprintf('\n So hinh train %d', nTrainImages);
    
    fprintf('\n Hinh thu %d\n', n);
    
    figure;
    img = imgTrainAll(:, n);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTrainAll(n));
    strLabelImage = [strLabelImage, ' (', num2str(n), ')'];
    imshow(img2D);
    title(strLabelImage);
end