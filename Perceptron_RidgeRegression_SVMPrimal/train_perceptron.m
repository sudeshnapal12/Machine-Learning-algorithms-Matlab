function [w, w_0] = train_perceptron(X,Y)

  w_0 = 0;
  w = zeros(1, size(X,2));
  
  %Number of samples
  m = size(X,1);
  
  %One pass of the sample
  for sample = 1 : m
      if(sign(w * X(sample,:)') ~= Y(sample))
        w = w + X(sample,:) * Y(sample);
      end
  end
  
  %First element is the bias
  w_0 = w(1);
  w = w(2:size(w,2));
end