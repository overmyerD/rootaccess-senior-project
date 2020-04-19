function image = canny_algorithm(image)
    % converts image from color to gray scale
%     image = rgb2gray(image);
    image = image(:,:,2);
    image = imadjust(image);
    image = imsharpen(image);

    
    image = medfilt2(image);
    
%     PSF = fspecial('gaussian');
%     image = deconvlucy(image,PSF);
%     [image,~] = deconvblind(image,PSF);
%     image(image<64) = 0;
    
%     contrast limited adaptive histogram equalization (CLAHE)
    image = adapthisteq(image);
    
    % covert image to double (gaussian filter requires double)
%     image = double(image);
    
    % filter
    sigma = 6;
    masksize = 2*(sigma*2.5);
    filter = fspecial('gaussian', masksize, sigma);

%     sigma = std2(image);
%     filter = imgaussfilt(sigma);
%     image = imgaussfilt(image);
%     
%     % convolution with gaussian filter
    image = conv2(image, filter, 'valid');
%     image = imfilter(image,filter);
%     image = adapthisteq(image);
%     
% % % % %     % generate threshold values using mean and stdv of image  
    lowthresh = max(1,(mean2(image)-std2(image)))/255;
    highthresh = min(254,(mean2(image)+std2(image)))/255;
    thresh = [lowthresh highthresh];
% % % % %     %     disp(thresh);
% % % % % 
    image = edge(image,'canny',thresh);
end

