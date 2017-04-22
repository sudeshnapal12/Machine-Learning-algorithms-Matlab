function [ypred] = test_multiclass_hinge_sgd(w, Xte)

    % size(y_class_matrix) = [#test_samples x k]
    y_class_matrix = Xte * w;
    
    [~, ypred] = max(y_class_matrix, [], 2);    
end