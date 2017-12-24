function imagePaths = retrieval(descriptor, queryImg, queryROI, numResults)
    
    % Tai thu muc dataset va image indexs phu hop
    if isequal(descriptor, 'surf')
        % Duong dan toi thu muc chua bo dataset Oxford Building
        dir = '/Users/quangphan/Documents/data_vir/oxbuild_images/';
        load('../features/index_surf.mat');
    elseif isequal(descriptor, 'hog-surf')
        % Duong dan toi thu muc chua bo dataset 1200 anh
        dir = '/Users/quangphan/Documents/data_vir/oxbuild_images_1k/';
        load('../features/index_hog.mat');
    end
    
    % neu toa do anh bang 0 thi ham retrieval se bi loi, 
    % ta phai loai bo truong hop nay
    for k = 1 : length(queryROI)
        if queryROI(k) <= 0
            queryROI(k) = 1;
        end
    end
    
    % Tim ra 20 index phu hop voi query
    if size(queryROI, 1) > 0
        % neu co queryROI thi chi can tim mot phan cuar hinh 
        [imageIDs, scores] = retrieveImages(queryImg, imageIndex, 'ROI', queryROI, 'NumResults', numResults);
    else
        [imageIDs, scores] = retrieveImages(queryImg, imageIndex, 'NumResults', numResults);
    end
    
    % tao imageDataStore tu thu muc chua dataset
    imds = imageDatastore(fullfile(dir));
    % Lay duong dan cua hinh tu cac index tim duoc
    imagePaths = imds.Files(imageIDs);
    % in danh sach duong dan ra man hinh
    imagePaths
end