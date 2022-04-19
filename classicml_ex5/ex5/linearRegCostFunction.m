function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% So, trying to remember how to implement this. Here goes. (Decent!)

h = X * theta; % predictions

sqrErrors = (h - y) .^2; % squared errors

cost = (1 / (2 * m)) * sum(sqrErrors);

costReg = (lambda / (2 * m)) * sum(theta(2:end) .^2); % regularisation term

J = cost + costReg; % regularised cost function

% Calculate gradient of cost

thetaZero = theta;
thetaZero(1) = 0; % zero out the first feature of theta that applies to the bias

grad = ((1 / m) * (h - y)' * X) + ...
    lambda / m * thetaZero';

% =========================================================================

grad = grad(:);

end
