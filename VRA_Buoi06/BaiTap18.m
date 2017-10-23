function BaiTap18()
    figure;
    img = imread('cameraman.jpg');
    imshow(img);
    points = detectHarrisFeatures(img);
    hold on;
    subpoints = points.selectStrongest(20);
    plot(subpoints);
end