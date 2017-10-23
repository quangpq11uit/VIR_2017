function BaiTap21()
    img1 = imread('cameraman.jpg');
    points1 = detectSURFFeatures(img1);
    img2 = imread('cameraman30.jpg');
    points2 = detectSURFFeatures(img2);
    
    [features1, validPoints1] = extractFeatures(img1, points1);
    [features2, validPoints2] = extractFeatures(img2, points2);
    
    indexPairs = matchFeatures(features1, features2);
    
    matchedPoints1 = validPoints1(indexPairs(:,1),:);
    matchedPoints2 = validPoints2(indexPairs(:,2),:);
    
    figure;
    ax = axes;
    
    showMatchedFeatures(img1, img2, matchedPoints1, matchedPoints2, 'montage', 'Parent', ax);
    title(ax, 'Candidates point matches');
    legend(ax, 'Matched points 1', 'Mathced points 2');
end