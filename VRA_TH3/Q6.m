function Q6(n)
    assert(n>=1 && n<=10000, 'n nam trong khoang 1 den 10000');
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
  
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
        
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    
    lblImageTest = lblTestAll(n);
    
    strLabelImage = 'Ban dau ';
    strLabelImage = [strLabelImage, num2str(lblImageTest)];
    strLabelImage = [strLabelImage, ' Du doan: '];
    strLabelImage = [strLabelImage, num2str(lblPredictTest)];

    if (lblImageTest == lblPredictTest)
        strLabelImage = [strLabelImage, ' Ket qua dung.'];
    else
        strLabelImage = [strLabelImage, ' Ket qua sai.'];
    end
    
    figure;
    img2D = reshape(imgTest, 28, 28);
    imshow(img2D);
    title(strLabelImage);

    fprintf('\n Ket thuc. \n');
end