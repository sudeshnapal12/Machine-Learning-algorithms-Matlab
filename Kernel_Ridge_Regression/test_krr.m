function ypredicted = test_krr(alpha, Xtr, ytr, Xte, lambda, kernel, gamma)
    Xtr = Xtr';
    ytr = ytr';
    Xte = Xte';
    ntr = size(Xtr, 1);
    nte = size(Xte, 1);
    
    K = zeros(nte, ntr);
    %K = zeros(ntr, ntr);
    
    for i = 1:nte
    %for i = 1:ntr
        for j = 1:ntr 
            x1 = Xte(i, :);
            %x1 = Xtr(i, :);
            x2 = Xtr(j, :);
            if strcmp(kernel, 'linear') == 1
                K(i, j) = linearKernel1(x1, x2);
            else
                K(i, j) = gaussianKernel1(x1, x2, gamma);
            end
        end
    end
    
    ypredicted = (1/(lambda * ntr)) * K * alpha;    
end