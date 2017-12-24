function buildBagWithCustomExtractor(datasetDir, extractor, bagFileName, imageIndexFileName)
    imds = imageDatastore(fullfile(datasetDir));
    if isequal(extractor, 'surf')
        imageIndex = indexImages(imds, 'SaveFeatureLocations', false);

        save(imageIndexFileName, 'imageIndex');
    elseif isequal(extractor, 'hog-surf')
        extractorFcn = @BagOfFeaturesHOGExtractor;
        bag = bagOfFeatures(imds,'CustomExtractor', extractorFcn, 'VocabularySize', 20000);
        imageIndex = indexImages(imds, bag, 'SaveFeatureLocations', false);

        save(bagFileName, 'bag');
        save(imageIndexFileName, 'imageIndex');
    end
end