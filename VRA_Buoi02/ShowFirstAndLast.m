function ShowFirstAndLast() 
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    fprintf('\n So hinh train %d', nTrainImages);
    
    nTrainLabels = size(lblTrainAll, 1);
    fprintf('\n So label train %d', nTrainLabels);
    
    figure;
    img = imgTrainAll(:, 1);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTrainAll(1));
    imshow(img2D);
    title(strLabelImage);
    
    figure;
    img_1 = imgTrainAll(:, nTrainImages);
    img2D_1 = reshape(img_1, 28, 28);
    strLabelImage_1 = num2str(lblTrainAll(nTrainImages));
    imshow(img2D_1);
    title(strLabelImage_1);
end