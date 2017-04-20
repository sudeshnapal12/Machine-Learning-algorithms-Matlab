function [w, w_0] = train_rr (X, Y, lambda)    
    IdentityMatrix = eye(size(X,2));
    C = X' * X + (lambda * IdentityMatrix);
    d = X' * Y;
    
    w = pinv(C) * d;

    w_0 = w(1);
    w = w(2:size(w, 1));
end