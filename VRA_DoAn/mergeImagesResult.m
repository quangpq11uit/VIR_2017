function image = mergeImagesResult(imagePaths) 
    images1 = [];
    for index = 1 : 5
        img = imread(imagePaths{index,:});
        images1 = [images1 imresize(img, [500 500])];
    end
    images2 = [];
    for index = 6 : 10
        img = imread(imagePaths{index,:});
        images2 = [images2 imresize(img, [500 500])];
    end
    images3 = [];
    for index = 11 : 15
        img = imread(imagePaths{index,:});
        images3 = [images3 imresize(img, [500 500])];
    end
    images4 = [];
    for index = 16 : 20
        img = imread(imagePaths{index,:});
        images4 = [images4 imresize(img, [500 500])];
    end

    image = [images1; images2; images3; images4];
end