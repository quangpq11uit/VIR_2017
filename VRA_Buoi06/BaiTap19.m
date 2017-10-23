function BaiTap19()
    img = imread('cameraman.jpg');
    points = detectSURFFeatures(img);
    [features, validPoints] = extractFeatures(img, points);
    figure;
    imshow(img);
    subValidPoints = validPoints.selectStrongest(20);
    hold on;
    plot(subValidPoints);
end