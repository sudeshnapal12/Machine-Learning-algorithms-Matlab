%load data of Housing dataset from the UCI repository.
load('cadata.mat');

% Xtrain, ytrain are randomly split train data. 
% Xtrain, ytest are randomly split test data.
% The task is to predict the median house value from features describing a town.

% Normalize the features
[X_train_norm, X_test_norm] = normalizeAll(Xtrain, Xtest);

% generate polynomial features from k = 1 to k = 5; k=degree of polynomial
% and train 5 different Linear regressors with these features
% find RMSE of train and test data

rmseTrain = zeros(5, 1);
rmseTest = zeros(5, 1);
for i = 1:5
    X_poly_train = generate_poly_features(X_train_norm, i);
    X_poly_test = generate_poly_features(X_test_norm, i);
    coefficients = pinv(X_poly_train) * ytrain;
    %rmseTrain(i,:) = sqrt(sum((X_poly_train * coefficients - ytrain).^2) / size(ytrain));
    %rmseTest(i,:) = sqrt(sum((X_poly_test * coefficients - ytest).^2) / size(ytest));
    rmseTrain(i,:) = sqrt(mean((X_poly_train * coefficients - ytrain).^2));
    rmseTest(i,:) = sqrt(mean((X_poly_test * coefficients - ytest).^2));
end

plot(rmseTrain);hold on;
plot(rmseTest);
xlabel('Degree of the polynomial');
ylabel('RMSE');
legend('training error', 'test error');
    