function LoadRandomImage() 
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    fprintf('\n So hinh train %d', nTrainImages);
    
    nNumber = randi([1 nTrainImages]);
    fprintf('\n Hinh thu %d', nNumber);
    
    figure;
    img = imgTrainAll(:, nNumber);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTrainAll(nNumber));
    strLabelImage = [strLabelImage, '(', num2str(nNumber), ')'];
    imshow(img2D);
    title(strLabelImage);
end