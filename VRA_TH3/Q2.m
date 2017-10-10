function Q2(n)
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
    
    nTrainImages = size(imgTestAll, 2);
    fprintf('\n So hinh test %d', nTrainImages);
    
    fprintf('\n Hinh thu %d\n', n);
    
    figure;
    img = imgTestAll(:, n);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTestAll(n));
    strLabelImage = [strLabelImage, ' (', num2str(n), ')'];
    imshow(img2D);
    title(strLabelImage);
end