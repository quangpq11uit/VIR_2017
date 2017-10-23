function BaiTap17()
    figure;
    img = imread('cameraman.jpg');
    imshow(img);
    points = detectSURFFeatures(img);
    hold on;
    subpoints = points.selectStrongest(20);
    plot(subpoints);
end

