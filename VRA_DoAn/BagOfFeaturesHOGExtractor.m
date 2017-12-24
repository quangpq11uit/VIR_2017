function [features, featureMetrics] = BagOfFeaturesHOGExtractor(I)
    [height,width,numChannels] = size(I);
    % Chuyen anh sang dang anh muc xam
    if numChannels > 1
        grayImage = rgb2gray(I);
    else
        grayImage = I;
    end
    % Tim cac diem interest points    
    points = detectSURFFeatures(grayImage);
    % Xay dung cac word bang HOG feature    
    features = extractHOGFeatures(grayImage, points, 'BlockSize', [5 5]);
    % Rut thong so can thiet tu cac dac trung
    featureMetrics = var(features,[],2);
end