% Main testing class

C = 10;
kernel = 'linear';
gamma = 0.001;
[alpha, objective] = train_ksvm_dual(Xtr, ytr, C, kernel, gamma);

% Count number of support vectors for alpha values > 0.001
% C=10 linear kernel = 3188 objective_value = 1.7544e+04
% C=10 gaussian kernel = 2896(2104) objective_value = 1.9467e+04 
% C=.1 linear kernel = 3074(1926) objective_value = 183.23
% C=.1 gaussian kernel = 2039 objective value = 251.3329
SVcount = 0;
tolerance = 0.001; % to handle double comparision
for i = 1:size(alpha)
    if abs(alpha(i)-0) > tolerance
        SVcount = SVcount + 1;
    end
end
fprintf('Number of support vectors %i', SVcount);  

ypredicted = test_ksvm_dual(alpha, Xtr, ytr, Xte, kernel, gamma);

count = 0;
for i = 1 : size(ypredicted,1)
  if(ypredicted(i)* yte(i) >0)
    count = count + 1;
  end
end

disp('------- SOFT SVM --------');
% C=10 linear kernel = 84.4578
% C=10 gaussian kernel = 85.1574 
% C=.1 linear kernel = 84.7576
% C=.1 gausian kernel = 75.9620
Accuracy = (count / size(ypredicted, 1) * 100);
disp(Accuracy);