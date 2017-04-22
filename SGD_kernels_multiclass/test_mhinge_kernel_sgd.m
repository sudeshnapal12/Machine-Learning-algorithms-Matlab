function [ypred] = test_mhinge_kernel_sgd(alpha, Xsv, Xte, p)
    [nFtrs, nTestSamples] = size(Xte);
    ypred = zeros(1, nTestSamples);
    nClasses = 10;
    
    for i=1:nTestSamples
        x_i = Xte(:, i);
        K = polynomialKernel(Xsv, x_i, 5);
        y_i_pred_matrix = repmat(K, nClasses, 1) .* alpha;
        y_i_pred = sum(y_i_pred_matrix, 2);
        [val, y_cap] = max(y_i_pred);
        ypred(i) = y_cap;
    end
end