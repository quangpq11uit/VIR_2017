function BaiTap23()
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
    
    [tform, inlinerMatchedPoints1, inlinerMatchedPoints2] = estimateGeometricTransform(matchedPoints1, matchedPoints2, 'similarity');
        
    showMatchedFeatures(img1, img2, inlinerMatchedPoints1, inlinerMatchedPoints2, 'montage', 'Parent', ax);
    title(ax, 'Matched inliner points');
    legend(ax, 'Matched points 1', 'Mathced points 2');
end