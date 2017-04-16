function [ypredicted] = test_ksvm_dual(alpha, Xtr, ytr, Xte, kernel, gamma)
    Xtr = Xtr';
    Xte = Xte';
    ytr = ytr';
    K = [];
    [testData, d] = size(Xte);
    [trainData, d] = size(Xtr);
    ypredicted = zeros(testData,1);

    for i = 1:testData
        summ = 0;
        for j = 1:trainData
            x1 = Xte(i,:);
            x2 = Xtr(j,:);            
            if strcmp(kernel, 'linear')
                K = linearKernel1(x1,x2);
            elseif strcmp(kernel,'gaussian')
                K = gaussianKernel1(x1,x2,gamma);
            end
            summ = summ + alpha(j)* ytr(j) * K;    
        end
        ypredicted(i) = sign(summ);    
    end
end
