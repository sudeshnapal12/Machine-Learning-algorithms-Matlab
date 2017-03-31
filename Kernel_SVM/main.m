% Main testing class

C = 10;
kernel = 'linear';
gamma = 0.001;
alpha = train_ksvm_dual(Xtr, ytr, C, kernel, gamma);

% Count number of support vectors
% C=10 linear kernel = 3188
% C=10 gaussian kernel = 2896
SVcount = 0;
tolerance = 0.001; % to handle double comparision
for i = 1:size(alpha)
    if abs(alpha(i)-0) < tolerance
        SVcount = SVcount + 1;
    end
end
fprintf('Number of support vectors %i', SVcount);

%Calculate objective value
    

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
Accuracy = (count / size(ypredicted, 1) * 100);
disp(Accuracy);