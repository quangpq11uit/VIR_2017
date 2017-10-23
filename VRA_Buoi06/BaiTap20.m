function BaiTap20()
    img = imread('cameraman.jpg');
    points = detectHarrisFeatures(img);
    [features, validPoints] = extractFeatures(img, points);
    figure;
    imshow(img);
    subValidPoints = validPoints.selectStrongest(20);
    hold on;
    plot(subValidPoints);
end