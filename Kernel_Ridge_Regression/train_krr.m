function alpha = train_krr(X, y, lambda, kernel, gamma)

    X = X';
    y = y';
    n = size(X,1);
    K = zeros(n, n);

    for i=1:n
        for j= 1:n
            x1 = X(i, :);
            x2 = X(j, :);
            if strcmp(kernel, 'linear')
                K(i, j) = linearKernel1(x1, x2);
            elseif strcmp(kernel, 'gaussian')
                K(i, j) = gaussianKernel1(x1, x2, gamma);
            end
        end
    end

    I = eye(size(K,2));
    C = K + (lambda * I);

    alpha = pinv(C) * y;

end    