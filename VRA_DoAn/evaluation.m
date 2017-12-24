function [percent, imgExist] = evaluation(descriptor, queryDir, query, datasetDir) 
    
    imgExist = 1;
    queryFile = strcat(query, '_query.txt');
    resultFile = strcat(query, '_good.txt');
    path = fullfile(queryDir, queryFile);
    
    fid = fopen(path);
    cells = textscan(fid,'%s %f %f %f %f');
    fclose(fid);
    
    imageName = strrep(cells{1}{1}, 'oxc1_','');
    imagePath = fullfile(datasetDir, strcat(imageName, '.jpg'));
    
    if ~exist(imagePath, 'file')
        percent = 0;
        imgExist = 0;
        return
    end
    
    x = int16(cells{2});
    y = int16(cells{3});
    w = int16(cells{4}) - x;
    h = int16(cells{5}) - y;
    
    query = imread(imagePath);
    
    path = fullfile(queryDir, resultFile);
    fid = fopen(path);
    cells = textscan(fid,'%s');
    fclose(fid);
    
    results = cells{1};
    
    resultPaths = retrieval(descriptor, query, [x y w h], length(results));
    
    for k=1:length(resultPaths)
        path = resultPaths{k};
        path = strrep(path, datasetDir, '');
        path = strrep(path, '.jpg', '');
        resultPaths{k} = path;
    end
    
    correctCount = intersect(results, resultPaths);
    
    percent = length(correctCount)/length(resultPaths);
end
