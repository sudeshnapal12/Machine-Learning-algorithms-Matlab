clear ; close all; clc

dataset = load('synth_data.mat');

Xtrain = dataset.Xtrain;
Ytrain = dataset.ytrain;
Xtest = dataset.Xtest;
Ytest = dataset.ytest;

% Adding this for the bias term
Xtrain_bias = [ones(length(Ytrain),1), Xtrain];

% PERCEPTRON PLOT
w_0 = 0;
w = [];

count = 0;

[w, w_0] = train_perceptron(Xtrain_bias, Ytrain);
Ypred = sign((w * Xtest') + w_0);
for i = 1 : size(Ypred, 2)
  if(Ypred(i) == Ytest(i))
    count = count + 1;
  end
end

disp('------- PERCEPTRON --------')
Accuracy = (count / size(Ypred, 2) * 100);
disp(Accuracy);

% plot perceptron
%plotScatter(Xtest, Ytest, w, w_0);
%title('Perceptron');
 
% RIDGE REGRESSION
lambda = 1;
[w, w_0] = train_rr(Xtrain_bias, Ytrain, lambda);

size(Xtest);
size(w);

exp_Y = sign(Xtest * w + w_0);

count = 0;

for i = 1 : size(Ypred, 2)
  if(exp_Y(i) == Ytest(i))
    count = count + 1;
  end
end

disp('------- RIDGE --------')
Accuracy = (count / size(Ypred, 2) * 100)
%plot ridge regression
%plotScatter(Xtest, Ytest, w, w_0);
%title('Ridge Regression');
 
% SVM
count = 0;

[w, w_0] = train_svm_primal(Xtrain, Ytrain, 0.01);

exp_Y = sign((Xtest * w) + w_0);

for i = 1 : size(exp_Y,1)
  if(exp_Y(i) == Ytest(i))
    count = count + 1;
  end
end

disp('------- SVM --------')
Accuracy = (count / size(exp_Y, 1) * 100);
disp(Accuracy)

% plot svm
plotScatter(Xtest, Ytest, w, w_0);
title('SVM Primal with C=0.01');