function Q2(n)
    fprintf('\n Load du lieu test');
    imgTestAll = loadData('DatabaseofFace/imgTestImagesAll.mat', 'imgTestImagesAll');
    lblTestAll = loadData('DatabaseofFace/lblTestLabelsAll.mat', 'lblTestLabelsAll');
    
    nTrainImages = size(imgTestAll, 2);
    fprintf('\n So hinh test %d', nTrainImages);
    
    fprintf('\n Hinh thu %d\n', n);
    
    figure;
    img = imgTestAll(:, n);
    img2D = reshape(img, 112, 92);
    strLabelImage = num2str(lblTestAll(n));
    strLabelImage = [strLabelImage, ' (', num2str(n), ')'];
    imshow(img2D);
    title(strLabelImage);
end