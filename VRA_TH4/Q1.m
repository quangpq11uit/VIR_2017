function Q1(n) 
    fprintf('\n Load du lieu train');
    imgTrainAll = loadData('DatabaseofFace/imgTrainImagesAll.mat', 'imgTrainImagesAll');
    lblTrainAll = loadData('DatabaseofFace/lblTrainLabelsAll.mat', 'lblTrainLabelsAll');
    
    nTrainImages = size(imgTrainAll, 2);
    fprintf('\n So hinh train %d', nTrainImages);
    
    fprintf('\n Hinh thu %d\n', n);
    
    figure;
    img = imgTrainAll(:, n);
    img2D = reshape(img, 112, 92);
    strLabelImage = num2str(lblTrainAll(n));
    strLabelImage = [strLabelImage, ' (', num2str(n), ')'];
    imshow(img2D);
    title(strLabelImage);
end