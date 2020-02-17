image = imread('test2.jpg');

red_image = image;
green = green_image;

% removes all green and blue from the image
red_image(:,:,2) = 0;
red_image(:,:,3) = 0;

%converts the 2 images to grayscale
red_copy = red_image(:,:,1);
green_copy = green_image(:,:,2);

% red_image(red_image < 86) = 0;
% 
% imshow(red_image);

green_copy(red_copy>86) = 0;

green(:,:,2) = green_copy;

avg = mean(mean(green));
green(green<64) = 0;


imshow(green);



%     % creates a 1d array of all green pixel values
%     high_green = green(:);
%     
%     % I dont think this does anything
%     % adjusts all pixels that are not the highest pixel value to be 0
%     if green_image(:,:,2) < max(high_green)
%         green_image(:,:,2) = 0;
%     end
%     
%     %green_image(green_image<128) = 0;