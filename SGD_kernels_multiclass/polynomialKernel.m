% Polynomial Kernel is distance between derived polynomial features of
% x1 and x2
function polyDistance = polynomialKernel(X1, X2, degree)
    %gaussian kernel
    %polyDistance = exp(-0.001.*pdist2(X1',X2','euclidean').^2);
    
    X2 = repmat(X2, 1, size(X1,2));
    dot_prod = X1 .* X2;
    K = sum(dot_prod, 1);
    polyDistance = K.^5;
        
end