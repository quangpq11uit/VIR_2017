function Q3()
    fprintf('\n Load du lieu train\n');
    lblTrainAll = loadMNISTLabels('../train-labels.idx1-ubyte');
    
    indexs = unique(lblTrainAll(:,1));
    numLabel = size(lblTrainAll, 1);
    numIndex = size(indexs, 1);
    results = zeros(numIndex, 2);

    for i=1:numIndex
       results(i, 1) = indexs(i);
    end
        
     for i=1:numLabel
         for j=1:numIndex
             if(lblTrainAll(i) == indexs(j))
                 results(j, 2) = results(j, 2) + 1;
                 break;
             end
         end
     end
    
    csvwrite('Q3.csv', results);
    fprintf('Ket qua:\n');
    fprintf([repmat('%d\t', 1, size(results, 2)) '\n'], results');

end