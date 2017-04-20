function [w,w_0] = train_svm_primal(X, y, C)

[m, d] = size(X);

% create a (d+m+1) X (d+m+1) matrix for H
H = [ eye(d) zeros(d, m+1) ; zeros(m+1, d+m+1)];

% f represents the summation of xi and we multiply it with C as given in
% the equation of SVM primal form
f = C * [ zeros(d+1, 1) ; ones(m,1)];

% A is a (d+m+1) X (d+m+1) matrix
A = - [y* ones(1,d) .* X, y, eye(m)];

% lower bound on xi is 0
lb = [-inf*ones(d+1,1); zeros(m,1)];

% upper bound = inf
ub = inf * ones(d+m+1,1);

% b is -1
b = -1 * ones(m,1);

w = quadprog(H, f, A, b, [], [], lb, ub, []);

% extract bias
w_0 = w(d+1);

% extract w
w = w(1:d);
end