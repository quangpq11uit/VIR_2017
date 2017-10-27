function Q5(n)
    assert(n>=1 && n<=120, 'n nam trong khoang 1 den 120');
    fprintf('\n Load du lieu train');
    imgTrainAll = loadData('DatabaseofFace/imgTrainImagesAll.mat', 'imgTrainImagesAll');
    lblTrainAll = loadData('DatabaseofFace/lblTrainLabelsAll.mat', 'lblTrainLabelsAll');
      
    fprintf('\n Load du lieu test');
    imgTestAll = loadData('DatabaseofFace/imgTestImagesAll.mat', 'imgTestImagesAll');
        
    %%  Extract Features
    featuresDataTrain = ExtractFeaturesPixel(imgTrainAll);
    
    %%  Build model KNN
    Mdl = fitcknn(featuresDataTrain, lblTrainAll);
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    
    strLabelImage = 'Du doan: ';
    strLabelImage = [strLabelImage, num2str(lblPredictTest)];

    figure;
    img2D = reshape(imgTest, 112, 92);
    imshow(img2D);
    title(strLabelImage);

    fprintf('\n Ket thuc. \n');
end