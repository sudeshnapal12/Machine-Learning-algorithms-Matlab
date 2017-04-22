load('mnist.mat')

Delta = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1;
         1, 0, 1, 1, 1, 1, 1, 1, 1, 1;
         1, 1, 0, 1, 1, 1, 1, 1, 1, 1;
         1, 1, 1, 0, 1, 1, 1, 1, 1, 1;
         1, 1, 1, 1, 0, 1, 1, 1, 1, 1;
         1, 1, 1, 1, 1, 0, 1, 1, 1, 1;
         1, 1, 1, 1, 1, 1, 0, 1, 1, 1;
         1, 1, 1, 1, 1, 1, 1, 0, 1, 1;
         1, 1, 1, 1, 1, 1, 1, 1, 0, 1;
         1, 1, 1, 1, 1, 1, 1, 1, 1, 0];
     
Delta2 = [0, 1, 2, 2, 2, 2, 2, 2, 2, 2;
         1, 0, 1, 2, 2, 2, 2, 2, 2, 2;
         2, 1, 0, 1, 2, 2, 2, 2, 2, 2;
         2, 2, 1, 0, 1, 2, 2, 2, 2, 2;
         2, 2, 2, 1, 0, 1, 2, 2, 2, 2;
         2, 2, 2, 2, 1, 0, 1, 2, 2, 2;
         2, 2, 2, 2, 2, 1, 0, 1, 2, 2;
         2, 2, 2, 2, 2, 2, 1, 0, 1, 2;
         2, 2, 2, 2, 2, 2, 2, 1, 0, 1;
         2, 2, 2, 2, 2, 2, 2, 2, 1, 0];
     
% SGD with multiclass hinge loss
[w] = train_multiclass_hinge_sgd(Xtr, ytr, Delta);
[ypred] = test_multiclass_hinge_sgd(w, Xte);

% SGD with multiclass hinge loss with polynomial kernel
%[alpha, Xsv] = train_mhinge_krnel_sgd(Xtr, ytr, Delta, 5);
%[ypred] = test_mhinge_kernel_sgd(alpha, Xsv, Xte, 5);

% 0-1 Loss
yte = yte-min(yte)+1;    
count = 0;
for i = 1:size(ypred,2)
    if yte(i)~=ypred(i)
        count = count + 1;
    end
end
Loss = count/size(ypred,2);
ConfusionMatrix = confusionmat(yte , ypred);
