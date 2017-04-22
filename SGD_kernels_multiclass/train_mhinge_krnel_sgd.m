% Stochastic sub-gradient descent for multiclass with kernels
function [alpha, Xsv] = train_mhinge_krnel_sgd(Xtr, ytr, Delta, p)
           
    [nFtrs, nSamples] = size(Xtr);
    nClasses = length(unique(ytr));
    % make classes from 1 to 10
    ytr = ytr-min(ytr)+1;    

    alpha = zeros(nClasses, 1);
    svIndex = [1];
           
    %for each sample you keep updating weights in Stochstic case
    for i = 2:nSamples
        eta = 1/sqrt(i);
        x_i = Xtr(:, i);         
        y_i = ytr(i);
            
        % compute kernel<x_i, Xtr(suppportIndices)> size(K)=[sv x 1]
        K = polynomialKernel(Xtr(:, svIndex), x_i, 5);
            
        % size(alpha) = [nclasses x sv]
        % size(y_i_pred) = [nclasses x 1]
        % size(y_i_pred_matrix) = [nclasses x nSamples]
        y_i_pred_matrix = repmat(K, nClasses, 1) .* alpha; %----------classes x nSamples
        y_i_pred = sum(y_i_pred_matrix, 2); % ------- classes x 1
          
        % val = hinge loss and y_cap is pred_y
        [val, y_cap] = max(Delta(:, y_i) + y_i_pred - y_i_pred(y_i));
        
        % set gt = si(xt, y_cap) - si(xt, yt)
        % wt+1,i = wt,i - eta * gt,i; => alpha = alpha - eta(plus or minus)
        % update only when hinge loss is > 0
        if val > 0 
            newSVIndex = find(svIndex==i);
            if sum(newSVIndex)==0 % new support vector 'i' is not in svIndex
                svIndex = [svIndex i];
                alpha = horzcat(alpha, zeros(nClasses, 1));
                alpha(y_cap, end) = alpha(y_cap, end) - eta;
                alpha(y_i, end) = alpha(y_i, end) + eta;
            else % support vector 'i' is in svIndex
                alpha(y_cap, newSVIndex) = alpha(y_cap, newSVIndex) - eta;
                alpha(y_i, newSVIndex) = alpha(y_i, newSVIndex) + eta;
            end
                
            %w(:, y_cap) = w(:, y_cap) - eta * Xtr(i, :)';
            %w(:, y_i) = w(:, y_i) + eta * Xtr(i, :)';     
        end
    
    alpha = alpha;
    Xsv = Xtr(:, svIndex);    
end