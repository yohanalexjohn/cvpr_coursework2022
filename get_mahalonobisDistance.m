function distance = get_mahalonobisDistance(query, candidate, eigenModel)

% Subtract each element of feature F1 and feature F2
x = query - candidate;

% Square these differences
x = x.^2;

x = x ./eigenModel;

% Sum up the square differences
x = sum(x);

% take the square root
distance = sqrt(x);