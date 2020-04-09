function canny_image = canny_algorithm(image)
    % converts image from color to gray scale
    image = rgb2gray(image);
    
    % covert image to double (gaussian filter requires double)
    image = double(image);
    
    % gaussian filter to remove noise
    sigma = 6;
    masksize = 2*(sigma*2.5);
    filter = fspecial('gaussian', masksize, sigma);
    
    % convolution with gaussian filter
    image = conv2(image, filter, 'valid');

    % generate threshold values using mean and stdv of image     
    lowthresh = max(1,(mean2(image)-std2(image)))/255;
    highthresh = min(254,(mean2(image)+std2(image)))/255;
    thresh = [lowthresh highthresh];
    
%     disp(thresh);
    
    canny_image = edge(image,'canny',thresh);
    
    
end

