% [X_train_norm, X_test_norm] = normalizeAll(X_train, X_test)
function [X_train_norm, X_test_norm] = normalizeAll(X_train, X_test)

% X_train is a MXD matrix, 
% it means M data points in D dimensional space.

mu_train = mean(X_train);
sigma_train = std(X_train);
X_train_norm = (X_train - mu_train)/sigma_train;

mu_test = mean(X_test);
sigma_test = std(X_test);
X_test_norm = (X_test - mu_test)/sigma_test;
end