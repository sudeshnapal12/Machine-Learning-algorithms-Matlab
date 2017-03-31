% Gaussian Kernel is to map data to infinite dimensional space
% Gaussian Kernel returns a radial basis function between x1 and x2 with bandwidth gamma 
function K = gaussianKernel(X, gamma)

n = size(X,1);
K = zeros(n, n);

for i=1:n
    for j= 1:n
        x1 = X(i, :);
        x2 = X(j, :);
        norm = sum((x1-x2).^2);        
        gausDistance = exp(-norm * gamma);
        K(i, j) = gausDistance;
    end
end
    
end