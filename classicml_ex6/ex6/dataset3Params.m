function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Create matrix to store error rates for various parings of C and sigma
cSig = zeros(8, 8);

% Create vector of test range for C and sigma, which happens to be the same
range = [0.01, 0.03, 0.10, 0.30, 1.00, 3.00, 10.0, 30.0];

% Nested for loop testing each combination of C and sigma drawn from test range
for i = 1:length(range),
  
  for j = 1:length(range),
   
    % Train model on current combination of C and sigma
    model = svmTrain(X, y, range(i), @(x1, x2) gaussianKernel(x1, x2, range(j)));
    
    % Predict values based on trained model
    predictions = svmPredict(model, Xval);
    
    % Error rate of model tested on cross-validation set
    predError = mean(double(predictions ~= yval));
    
    % Store error in appropriate site within matrix
    cSig(i, j) = predError;
    
  endfor

end

% Find lowest error index within matrix
[r1, r2] = find(cSig == min(min(cSig)));

C = range(r1);

sigma = range(r2);

% SUCCESS!

% =========================================================================

##% Another clever way of doing this...
##Cs = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];
##sigmas = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];
##
##% Minimized err.
##% Note: intmax should be so large that the first iteration becomes min.
##minError = intmax;
##
##% Nested for-loop to hit all combinations of C and sigma values.\
##% Not even going to try to vectorize...
##for i = 1:length(Cs)
##	for j = 1:length(sigmas)
##		% Calculate model/prediction/error for these C and sigma values.
##		model = svmTrain(X, y, Cs(i), @(x1, x2) gaussianKernel(x1, x2, sigmas(j)));
##		pred = svmPredict(model, Xval);
##		predError = mean(double(pred ~= yval));
##
##		% Calculated error is less than our previous best.
##		% Keep track of the error and C/sigma values used so we can
##		% compare against future predictions.
##		if (predError <= minError)
##			minError = predError;
##			C = Cs(i);
##			sigma = sigmas(j);
##		end;
##	end;
##end;

end
