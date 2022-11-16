function F = get_globalHistColours(img)

Q = 4;

% multiply qimg by Q, then drop the decimal point.

qimg = floor(img.*Q);

% Now, create a single integer value for each pixel that summarises the
% RGB value.  We will use this as the bin index in the histogram.

bin = qimg(:,:,1)*Q^2 + qimg(:,:,2)*Q^1 + qimg(:,:,3);

% 'bin' is a 2D image where each 'pixel' contains an integer value in
% range 0 to Q^3-1 inclusive.

% We will now use Matlab's hist command to build a frequency histogram
% from these values.  First, we have to reshape the 2D matrix into a long
% vector of values.

vals=reshape(bin,1,size(bin,1)*size(bin,2));

% Now we can use hist to create a histogram of Q^3 bins.

F = hist(vals,Q^3);

% It is convenient to normalise the histogram, so the area under it sum
% to 1.

F = F./sum(F);

return;