function canny_image = canny_algorithm(image)
%     image = rgb2gray(image);
%     thresh = graythresh(image);
%     image = imbinarize(image,thresh);
%     image = edge(image,'canny');
%     canny_image = imdilate(image,strel('disk',3));

    image = image(:,:,2);
    image = imgaussfilt(image);
    canny_image = edge(image,'canny',.03,3.5);
    

% image = image(:,:,2);
% [~,threshOut] = edge(image,'Canny');
% threshold = threshOut*1.0;
% canny_image = edge(image,'Canny',threshold);
end