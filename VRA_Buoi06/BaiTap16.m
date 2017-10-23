function BaiTap16()
    img = imread('cameraman.tif');
    img = rgb2gray(img);
    imwrite(img, 'cameraman.jpg');
    img2 = imrotate(img, 30);
    imwrite(img2, 'cameraman30.jpg');
end

