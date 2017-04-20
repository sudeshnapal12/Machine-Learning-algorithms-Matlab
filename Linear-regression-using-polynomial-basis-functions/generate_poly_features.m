function [X_poly] = generate_poly_features(X,k)
    X_poly = X;
    for i = 2:k
        X_poly = horzcat(X_poly, X.^i);
    end
end