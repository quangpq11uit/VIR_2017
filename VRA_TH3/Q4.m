function Q4()
    fprintf('\n Load du lieu test\n');
    lblTestAll = loadMNISTLabels('../t10k-labels.idx1-ubyte');
    
    indexs = unique(lblTestAll(:,1));
    numLabel = size(lblTestAll, 1);
    numIndex = size(indexs, 1);
    results = zeros(numIndex, 2);

    for i=1:numIndex
       results(i, 1) = indexs(i);
    end
        
     for i=1:numLabel
         for j=1:numIndex
             if(lblTestAll(i) == indexs(j))
                 results(j, 2) = results(j, 2) + 1;
                 break;
             end
         end
     end
    
    csvwrite('Q4.csv', results);
    fprintf('Ket qua:\n');
    fprintf([repmat('%d\t', 1, size(results, 2)) '\n'], results');

end