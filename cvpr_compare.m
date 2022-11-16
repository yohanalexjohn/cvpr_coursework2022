function dst = cvpr_compare(F1, F2)

% This function should compare F1 to F2 - i.e. compute the distance
% between the two descriptors

% Subtract each element of feature F1 and feature F2
x = F1 - F2;

% Square these differences
x = x.^2;

% Sum up the square differences
x = sum(x);

% take the square root
dst = sqrt(x);

return;
