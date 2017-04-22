function [w] = train_multiclass_hinge_sgd(Xtr, ytr, Delta)
    
    [nSamples, nFtrs] = size(Xtr);
    nClasses = length(unique(ytr));
    ytr = ytr-min(ytr)+1;    

    w = zeros(nFtrs , nClasses);
    
    % for nSamples number of iterations
    %for t = 1:20
     %   eta = 1/sqrt(t);
        
        %for each sample you keep updating weights
        for i = 1:nSamples
            eta = 1/sqrt(i);
            x_i = Xtr(i, :);            
            y_i_pred = x_i * w;
            [val, y_cap] = max(Delta(ytr(i), :) + y_i_pred - y_i_pred(ytr(i)));
            
            % set gt = si(xt, y_cap) - si(xt, yt)
            % wt+1,i = wt,i - eta * gt,i;
            if val > 0
                w(:, y_cap) = w(:, y_cap) - eta * Xtr(i, :)';
                w(:, ytr(i)) = w(:, ytr(i)) + eta * Xtr(i, :)';                
            end
        end
    %end
    
end