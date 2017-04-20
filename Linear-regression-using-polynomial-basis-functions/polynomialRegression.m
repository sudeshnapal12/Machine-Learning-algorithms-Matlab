%load data of Housing dataset from the UCI repository.
load('cadata.mat');

% Xtrain, ytrain are randomly split train data. 
% Xtrain, ytest are randomly split test data.
% The task is to predict the median house value from features describing a town.

% Normalize the features
[X_train_norm, X_test_norm] = normalizeAll(Xtrain, Xtest);
%because values of Y range in real numbers, it is better to normalize to
%understand RMSE errors
Y_train_norm = -1 + 2*(ytrain - min(ytrain))./(max(ytrain) - min(ytrain));
Y_test_norm = -1 + 2*(ytest - min(ytest))./(max(ytest) - min(ytest));

% generate polynomial features from k = 1 to k = 5; k=degree of polynomial
% and train 5 different Linear regressors with these features
% find RMSE of train and test data

rmseTrain = zeros(5, 1);
rmseTest = zeros(5, 1);
for k = 1:5
    X_poly_train = generate_poly_features(X_train_norm, k);
    X_poly_test = generate_poly_features(X_test_norm, k);
    
    [w, w_0] = train_ls(X_poly_train, Y_train_norm, 0);
    
    trainError = testRegressor(w, w_0, X_poly_train, Y_train_norm);
    trainErrorData(1,k) = trainError;
    testError = testRegressor(w, w_0, X_poly_test, Y_test_norm);
    testErrorData(1,k) = testError;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % JUST SIMPLY
    coefficients = pinv(X_poly_train) * Y_train_norm;
    %rmseTrain(k,:) = sqrt(sum((X_poly_train * coefficients - ytrain).^2) / size(ytrain));
    %rmseTest(k,:) = sqrt(sum((X_poly_test * coefficients - ytest).^2) / size(ytest));
    rmseTrain(k,:) = (sum((X_poly_train * coefficients - Y_train_norm).^2));
    rmseTest(k,:) = (sum((X_poly_test * coefficients - Y_test_norm).^2));
end

plot(rmseTrain);hold on;
plot(rmseTest);
xlabel('Degree of the polynomial');
ylabel('RMSE');
legend('training error', 'test error');

function [error] = testRegressor(w, w_0, xtest, ytest)
    [rows, cols] = size(xtest);
    
    %insert 1 to each row
    xtest = horzcat(xtest, ones(rows,1));
    
    %insert w_0 at the end of w matrix
    w(cols + 1) = w_0;
    
    error = sum((xtest * w - ytest).^2);
end
    