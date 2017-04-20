function [X_train_norm, X_test_norm] = normalizeAll(X_train, X_test)

    % X_train is a MXD matrix, 
    % it means M data points in D dimensional space.

    X_train_norm = -1 + 2.*(X_train - min(X_train))./(max(X_train) - min(X_train));
    X_test_norm = -1 + 2.*(X_test - min(X_test))./(max(X_test) - min(X_test));

end