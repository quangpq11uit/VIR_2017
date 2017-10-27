function Q6(n)
    assert(n>=1 && n<=120, 'n nam trong khoang 1 den 120');
    fprintf('\n Load du lieu train');
    imgTrainAll = loadData('DatabaseofFace/imgTrainImagesAll.mat', 'imgTrainImagesAll');
    lblTrainAll = loadData('DatabaseofFace/lblTrainLabelsAll.mat', 'lblTrainLabelsAll');
      
    fprintf('\n Load du lieu test');
    imgTestAll = loadData('DatabaseofFace/imgTestImagesAll.mat', 'imgTestImagesAll');
    lblTestAll = loadData('DatabaseofFace/lblTestLabelsAll.mat', 'lblTestLabelsAll');

    %%  Extract Features
    featuresDataTrain = ExtractFeaturesPixel(imgTrainAll);
    
    %%  Build model KNN
    Mdl = fitcknn(featuresDataTrain, lblTrainAll);
        
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
    img2D = reshape(imgTest, 112, 92);
    imshow(img2D);
    title(strLabelImage);

    fprintf('\n Ket thuc. \n');
end