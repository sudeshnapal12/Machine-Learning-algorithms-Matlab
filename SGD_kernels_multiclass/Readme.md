# Implement Stochastic Gradeint desccent over the multiclass hinge loss with kernels.

* Used polynomial kernel of the form k(x, x') = (<x, x'>)<sup>p</sup>, where p is the parameter or degree of polynomial.
* Suggested learning rate is eta = 1/sqrt(i) where i is the i<sup>th</sup> sample while iterating through the training data.
* Matrix Delta is the amount of penalty you would pay in case of wrong prediction.
  * <b>Case 1</b>: you pay 0 for each correct prediction and 1 for each wrong one
  * <b>Case 2</b>: you pay 0 for each correct prediction, 1 for each wrong prediction between classes whose digits are one number apart one from the other (e.g. you predicted "2" and the
correct label is "3"), and pay 2 for all the other cases.

<b>RESULTS</b>
* 0/1 loss for both the deltas is the same = 3.75% 
It didn't matter what deltas were defined.
* The loss run on 100 samples was 37%. On 1000 samples was 14% and 10000 samples was 6.33%. Loss was reducing very fast. It didn't matter much after certain number of samples.
* Also attached confusion_matrix.png which is same for both the deltas.
