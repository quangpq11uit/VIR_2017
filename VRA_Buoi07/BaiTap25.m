function BaiTap25()

     rootFolder = fullfile('DataTrain');
     category = {'0','1','2','3','4','5','6','7','8','9'};
     imds = imageDatastore(fullfile(rootFolder, category), 'LabelSource', 'foldernames');
     
     tbl01 = countEachLabel(imds)
     
     minSetCount = min(tbl01{:, 2});
     imds = splitEachLabel(imds, minSetCount, 'randomize');
     
     tbl02 = countEachLabel(imds)
     
    %% Load bag from files
%     bag = bagOfFeatures(imds);
    
    %% Load bag from mat
    bag = loadData('bag.mat', 'bag');
    
    %% Extract features
    
    img = readimage(imds, 1);
    featureVector = encode(bag, img);
    figure
    bar(featureVector);
    title('Visual word occurrences');
    xlabel('Visual word index');
    ylabel('Frequency of occurrences');
    
    %% Load classifier
%     categoryClassifier = trainImageCategoryClassifier(imds, bag);
    categoryClassifier = loadData('categoryClassifier.mat', 'categoryClassifier');
    
    %% Data Test
    rootFolder = fullfile('DataTest');
    category = {'0','1','2','3','4','5','6','7','8','9'};
    
    imds = imageDatastore(fullfile(rootFolder, category), 'LabelSource', 'foldernames');
    
    tbl01 = countEachLabel(imds)
    
    confMatrixTest = evaluate(categoryClassifier, imds);
    
    mean(diag(confMatrixTest));
end