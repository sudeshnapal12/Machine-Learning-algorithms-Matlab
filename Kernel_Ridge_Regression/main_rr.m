load adult.mat;
% lambda = 0.002 and linear kernel 
%------------Trainerror = 15.52 Testerror = 15.39 
alpha = train_krr(Xtr, ytr, .002, 'linear', .001);
ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'linear', .001);

% lambda = 0.002 and gaussian kernel 
%------------Trainerror = 25.2800 Testerror = 24.04 
%-----probably overfit happened using gaussian kernel with same lambda
%alpha = train_krr(Xtr, ytr, .002, 'gaussain', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'gaussian', .001);

% lambda = 2e - 05 = .00002 and linear kernel
%----------- Trainerror = 15.52 Testerror = 15.3923
%alpha = train_krr(Xtr, ytr, .00002, 'linear', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .00002, 'linear', .001);

% lambda = 2e - 05 = .00002 and gaussian kernel
%-----------Trainerror = 9.9400 Testerror = 15.6422 
%alpha = train_krr(Xtr, ytr, .00002, 'gaussian', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .00002, 'gaussian', .001);

count = 0;
for i = 1 : size(ypredicted,1)
  if(ypredicted(i)* yte(i) >0)
    count = count + 1;
  end
end

count_tr = 0;
for i = 1 : size(ypredicted,1)
  if(ypredicted(i)* ytr(i) >=0)
    count_tr = count_tr + 1;
  end
end

disp('------- Kernel Ridge Regression --------');
Accuracy_test = (count / size(ypredicted, 1) * 100);
Accuracy_train = (count_tr / size(ypredicted, 1) * 100);
%disp(Accuracy);
disp('Test error');
disp(100-Accuracy_test);

disp('Train error');
disp(100-Accuracy_train);
