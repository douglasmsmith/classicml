function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X_norm, 2));
sigma = zeros(1, size(X_norm, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

    % Get average values for each feature (column) in X.
    mu = mean(X_norm);

    % Calculate the standard deviation for each feature.
    sigma = std(X_norm);

    % Subtract mean values from each feature (column) of every example (row)
    % to make all features be spread around zero.
    X_norm = X_norm - mu;

    % Normalize each feature values for each example so that all features 
    % are close to [-1:1] boundaries.
    X_norm = X_norm ./ sigma;
    
% ============================================================

end
