load adult.mat;
% lambda = 0.002 and linear kernel 
%------------Trainerror = 100-84.4800 Testerror=100-84.6077
alpha = train_krr(Xtr, ytr, .002, 'linear', .001);
ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'linear', .001);

% lambda = 0.002 and gaussian kernel 
%-----------Testerror = 100-75.96 Trainerror =
%alpha = train_krr(Xtr, ytr, .002, 'gaussain', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'gaussian', .001);

% lambda = 2e - 05 and linear kernel
%-----------Testerror =  Trainerror =
%alpha = train_krr(Xtr, ytr, .00002, 'linear', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'linear', .001);

% lambda = 2e - 05 and gaussian kernel
%-----------Testerror =  Trainerror =
%alpha = train_krr(Xtr, ytr, .00002, 'gaussian', .001);
%ypredicted = test_krr(alpha, Xtr, ytr, Xte, .002, 'linear', .001);

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