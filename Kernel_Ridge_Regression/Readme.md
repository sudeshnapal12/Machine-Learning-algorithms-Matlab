### Implement Kernel Ridge Regression </br>

(a) Implement a function that finds alpha for the Kernel Ridge Regression formulation with kernels, using the
expression found in the previous question. The prototype must be </br>

      alpha = train_krr(X, y, lambda, kernel, gamma) 

where kernel is __'gaussian' for Gaussian kernels and 'linear' for linear kernels__, gamma is the parameter
of the Gaussian kernel. [gamma = 0.001]</br></br>
(b) Given a matrix of test points Xte, implement a Matlab function that
computes the prediction using the ridge regression solution expressed in terms of alpha. The prototype
must be </br>

     ypredicted = test_krr(alpha, Xtr, ytr, Xte, lambda, kernel, gamma)

where kernel is __'gaussian' for Gaussian kernels and 'linear' for linear kernels__, gamma is the parameter
of the Gaussian kernel.</br>

(c) Train and test your implementations of Kernel Ridge Regression with the provided dataset with
__lambda = 2e - 05__, __Gaussian and linear kernel__. Report training and test error. </br>

(d) Repeat the above with __lambda = 0:002__.</br>

__NOTE:__ Change comments and uncomments in test_krr.m to get train error. So, basically loop across testing samples while calculating test error and loop around training samples while calculating train error. </br>
