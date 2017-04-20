# Machine-Learning---Linear-regression-using-polynomial-basis-functions

Implement linear regression using polynomial basis functions. Use only monomials of a single variable, and no cross-terms.

* Implement a Matlab function that normalizes all the input data attributes to be between -1 and 1.</br>
[X_train_norm, X_test_norm] = normalizeAll(X_train, X_test)</br>
Note that only training data can be used for learning the normalization transformation. This will be
used to prevent numerical instability in dealing with numbers that are too big or too small.

* Implement a function that generates a matrix of input samples that contains the powers of each feature from 1 to k</br>
[X_poly] = generate_poly_features(X,k)

* Use the training and test data provided in the file "cadata.mat". They correspond to a random split
train/test of the Housing dataset from the UCI repository. The task is to predict the median house
value from features describing a town. Use the code you wrote above to generate polynomial features
from k = 1 to k = 5, normalize the features, and train 5 different LS regressors (with bias w0) with
these features. Plot training error and test error for each value of k and discuss the results.
