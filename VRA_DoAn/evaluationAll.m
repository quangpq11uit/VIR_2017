function evaluationAll(descriptor, queryDir, datasetDir)
    dinfo = dir('/Users/quangphan/Documents/data_vir/gt_files_170407/');
    count = 0;
    sumPercent = 0;
    for k = 1 : length(dinfo)
        fileName = dinfo(k).name;
        if contains(fileName, 'query')
            query = strrep(fileName, '_query.txt', '');
            fprintf('%s', query);
            [percent, exist] = evaluation(descriptor, queryDir, query, datasetDir);
            if exist
                count = count + 1;
                sumPercent = sumPercent + percent;
            end
        end
    end
    
    result = sumPercent/count;
    fprintf('Trung binh ket qua dung: %f', result);
end