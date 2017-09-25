function Digits_kNN()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
  
    imgTrainAll_1 = rot90(imgTrainAll, 3); 

    Mdl = fitcknn(imgTrainAll_1, lblTrainAll);
    
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    imgTestAll_1 = rot90(imgTestAll, 3); 

    nTestImgs = size(imgTestAll_1, 1);
    nNumber = randi([1 nTestImgs]);
    
    imgTest = imgTestAll_1(nNumber,:);
    lblPredictTest = predict(Mdl, imgTest);
    
    lblImageTest = lblTestAll(nNumber);
    
    figure;
    img2D = reshape(imgTest, 28, 28);
    imshow(img2D);
    strLabelImage = 'Ban dau ';
    strLabelImage = [strLabelImage, num2str(lblImageTest)];
    strLabelImage = [strLabelImage, ' Du doan: '];
    strLabelImage = [strLabelImage, num2str(lblPredictTest)];

    if (lblImageTest == lblPredictTest)
        strLabelImage = [strLabelImage, ' Ket qua dung.'];
    else
        strLabelImage = [strLabelImage, ' Ket qua sai.'];
    end
    title(strLabelImage);
    
    fprintf('\n Ket thu. \n');
end