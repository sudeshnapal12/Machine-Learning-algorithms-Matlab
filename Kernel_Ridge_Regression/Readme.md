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
For train error and test error values check main_rr.m </br>

lambda = 0.002 and linear kernel --- Trainerror = 15.52 Testerror = 15.39</br>
lambda = 0.002 and gaussian kernel --- Trainerror = 25.2800 Testerror = 24.04</br>
CONCLUSION - probably overfit happened using gaussian kernel(more features) with same lambda 

lambda = .00002 and linear kernel --- Trainerror = 15.52 Testerror = 15.3923 </br>
lambda = .00002 and gaussian kernel --- Trainerror = 9.9400 Testerror = 15.6422 </br>
CONSLUSION - change of regularization factor, (lambda) had no effect on linear kernel's train and test error. But reducing regulatization factor actually improved training error and hence test error for gaussian kernel.

