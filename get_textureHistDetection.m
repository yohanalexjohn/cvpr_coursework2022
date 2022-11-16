function texture_descriptor = get_textureHistDetection(img)

Q = 4;

%% Get the texture data for the image

% 1) Greyscale in the input image 
greyScaleImg = img(:,:,1)*0.30 + img(:,:,2)*0.59 + img(:,:,3)*0.11;

% 2) Blur the image - Using Gaussian Filter
blurredImage = imgaussfilt(greyScaleImg,2);

% 3) Create matrices containing the ‘x’ and ‘y’ kernels of the Sobel filter
sobelFilter = [ 1 2 1 ; 0 0 0 ; -1 -2 -1 ]./4;
sobelFilterT = sobelFilter';

% 4) Convolve the normalised greyscale image with the filters to get the 
%    smoothed 1st derivatives with respect to x and y.
dx = conv2(blurredImage,sobelFilter,'same');
dy = conv2(blurredImage,sobelFilterT,'same');

% 5) Compute the magnitude of the gradient.
textureImg = sqrt(dx.^2 + dy.^2);

%% Get the Texture Descriptor for the image
% 1) Create the bins
bin = floor(textureImg.*Q);

% 2) We have to reshape the 2D matrix into a long vector of values.
vals=reshape(bin,1,size(bin,1)*size(bin,2));

% 3) Use hist to create a histogram of Q^3 bins.
texture_descriptor = hist(vals,Q^3);

% 4) It is convenient to normalise the histogram, so the area under it sum
%    to 1.
texture_descriptor = texture_descriptor./sum(texture_descriptor);








