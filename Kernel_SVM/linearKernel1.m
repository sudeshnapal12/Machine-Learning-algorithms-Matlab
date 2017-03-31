% Linear Kernel is like a dummy kernel in which the transformed feature
% space is same as the original feature space.
% Linear Kernel returns the similarity betweeen x1 and x2.
function K = linearKernel(x1, x2)

    K = x1 * x2';  % dot product

end