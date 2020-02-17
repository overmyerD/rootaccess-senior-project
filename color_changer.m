% reads in image
image = imread('test2.jpg');

% copies the original image into 2 copies that will be changed
green_image = image;

% removes all blue and red from the image
green_image(:,:,1) = 0;
green_image(:,:,3) = 0;

for x=0:0
    % creates array of all green values
    green = green_image(:,:,2);
    
    % sums all values of the green values of an x column of the image
    values = sum((green(:,:)));
    
    for i=1:length(values)
        if values(i) < sum(values)/(length(values)-sum(values(:)==0))
            green_image(:,i,2) = 0;
        end
    end
end

imshow(green_image);