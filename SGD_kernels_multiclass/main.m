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
% I took each row as a sample in Xtr
%Xtr = Xtr';
%ytr = ytr';
%Xte = Xte';
%yte = yte';
%[w] = train_multiclass_hinge_sgd(Xtr, ytr, Delta2);
%[ypred] = test_multiclass_hinge_sgd(w, Xte);
%yte = yte-min(yte)+1;    
%count = 0;
%for i = 1:size(ypred,1)
%    if yte(i)~=ypred(i)
%        count = count + 1;
%    end
%end
%Loss = count/size(ypred,1);
%ConfusionMatrix = confusionmat(yte , ypred);
    
% SGD with multiclass hinge loss with polynomial kernel
% I took each column as a sample in Xtr
[alpha, Xsv] = train_mhinge_krnel_sgd(Xtr, ytr, Delta, 5);
[ypred] = test_mhinge_kernel_sgd(alpha, Xsv, Xte, 5);

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