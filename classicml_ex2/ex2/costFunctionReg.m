function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% identical to costFunction.m
h = sigmoid(X * theta);

% My first attempt
%
% J = ((1 / m) * sum((-y. * log(h)) - ((1-y). * log(1-(h)))))
%    + ( (1 / (2 * m)) * lambda * (sum(theta((2:size(theta)) ^ 2))));
%
%  grad = ((1 / m) .* X' * (h - y)) + ( (1 / m) * lambda) * theta(2:size(theta));

% cost term - identical to costFunction.m
cost = (1 / m) * sum((-y .* log(h)) - ((1 - y) .* log(1 - (h))));

% regularise term - skipping theta(0)
% "end" keyword refers to the last element in matrix so we can subset matrix
regCost = (lambda / (2 * m)) * norm(theta([2:end])) ^ 2;

% identical to costFunction.m
grad = (1 / m) .* X' * (h - y);

%regularise gradient term - skipping theta(0)
regGrad = (lambda / m) .* theta;
regGrad(1) = 0;

% Regularisation just consists of summing the original cost
% with the regularised term.
J = cost + regCost
grad = grad + regGrad

% =============================================================

end
