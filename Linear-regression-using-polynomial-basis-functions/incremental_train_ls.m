%implementation of Sherman Morris method of matrix inversion algorithm
function [w] = incremental_train_ls(X, y)
    [numSamples , cols] = size(X) ;
    
    % we will pick first col samples to make sure A'*A is invertible
    % because we will need this inverse to start the algorithm
    firstSample = X(1:cols, :);
    A = transpose(firstSample) * firstSample;
    
    % intialize inverse matrix
    currentInverseMatrix - inv(A);
    
    %for each beyond first cols samples update inverse matrix
    for i= cols+1:numSamples
        currentSample = X(i, :);
        
        %since we are chaining just one row at a time
        % (B'B) = A'A + v * v ' , where v' is the new row vector
        % representing the new sample point
        v = transpose(currentSample);
        currentInverseMatrix = coomputeNewInverse(currentInverseMatrix, v);
    end
    w = currentInverseMatrix * transpose(X) * y;
    
 function [newInverse] = computeNewInverse (currentInverseMatrix , v)
    numerator = currentInverseMatrix * transpose(v) * currentInverseMatrix;
    denominator = 1 + tranpose(v) * currentInverseMatrix * v;
    newInverse = currentInverseMatrix - numerator/denomiator;
 end