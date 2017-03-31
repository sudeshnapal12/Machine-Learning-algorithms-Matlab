function [alpha] = train_ksvm_dual(X, y, C, kernel, gamma)
    X = X';
    y = y';
    [noSamples, ~] = size(X);
    K = zeros(noSamples, noSamples);
    linearFlag = false;
    for i=1:noSamples
        for j= 1:noSamples
            x1 = X(i, :);
            x2 = X(j, :);
            if strcmp(kernel, 'linear')
                linearFlag = true;
                K = linearKernel(X);
                break;
            elseif strcmp(kernel, 'gaussian')
                K(i, j) = gaussianKernel1(x1, x2, gamma);
            end
        end
        if linearFlag == true
            break;
        end
    end

    H = K.*(y*y');
    f = -1*ones(noSamples,1);
    Aineq = zeros(1, noSamples);
    bineq = 0;
    Aeq = zeros(1, noSamples);
    beq = 0;
    lb = zeros(noSamples,1);
    ub = C*ones(noSamples, 1);
    % call MATLAB quadprog (max iter = 100)
    % = optimset('Algorithm','interior-point-convex','Display','iter','MaxIter', 100);
    alpha = quadprog(H, f , Aineq, bineq, Aeq, beq, lb, ub, [], []);
    eps = .001;
    support = find(alpha > eps);
end