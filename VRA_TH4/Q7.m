function Q7(n)
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
        
    numLabel = size(lblTestAll, 2);
    result = 0;

    for i=1:numLabel
        label = lblTestAll(:,i);
        if(label == n)
            imgTest = imgTestAll(:, i);
            if(predict(Mdl, imgTest') ~= label)
                result = result + 1;
                fprintf('\n Hinh thu %d sai, tong so %d\n', i, result);
            end
        end
    end
     
    fprintf('\n Ket qua: %d \n', result);
end