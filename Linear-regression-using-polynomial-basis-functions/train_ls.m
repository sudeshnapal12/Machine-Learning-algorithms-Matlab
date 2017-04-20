function [w, w_0 ] = train_ls(X,Y, bias)

    [ numSamples , ~ ] = size(X) ;

    %if bias is set then add extra column with all ones
    if bias == 1
        col = ones(numSamples , 1);
        X = [X col];
    end

    % get the diagonnal matrix by doing eigen value decomposition
    [V,D,W] = eig(transpose(X) * X) ;

    % get the diagonal elements and change the element values which are not 0
    d = diag(D);
    for i = 1:length(d)
        if d(i) ~= 0
            d(i) = 1/d(i);
        end
    end
    
    % compute the D+ matrix
    DPlus = diag(d);

 	% compute the final w matrix
    w = V * DPlus * transpose(V) * transpose(X) * Y;

    if bias == 0
        w_0 = 0;
    else
        w_0 = w(end);
        w(end) = [] ;
    end
end