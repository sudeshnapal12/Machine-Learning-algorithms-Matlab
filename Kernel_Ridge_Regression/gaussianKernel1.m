% Gaussian Kernel is to map data to infinite dimensional space
% Gaussian Kernel returns a radial basis function between x1 and x2 with bandwidth gamma 
function gausDistance = gaussianKernel1(x1, x2, gamma)

    norm = sum((x1-x2).^2);        
    gausDistance = exp(-norm * gamma);
    
end