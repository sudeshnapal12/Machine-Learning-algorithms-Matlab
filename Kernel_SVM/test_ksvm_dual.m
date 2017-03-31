function [ypredicted] = test_ksvm_dual(alpha, Xtr, ytr, Xte, kernel, gamma)
    Xtr = Xtr';
    Xte = Xte';
    ytr = ytr';
    K = [];
    [trainData, d] = size(Xte);
    [testData, d] = size(Xtr);
    ypredicted = zeros(testData,1);

    for i = 1:testData
        summ = 0;
        for j = 1:trainData
            x1 = Xtr(j,:);
            x2 = Xte(i,:);
            if strcmp(kernel, 'linear')
                K = linearKernel1(x1,x2);
            else
                if strcmp(kernel,'gaussian')
                   K = gaussianKernel1(x1,x2);
                end
            end
            summ = summ + alpha(j)* ytr(j) * K;    
        end
        ypredicted(i) = sign(summ);    
    end
end