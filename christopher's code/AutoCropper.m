function cropped_image = AutoCropper(image)
    % Predefined parameters
    f = @(span,width) 2.^(-((2/width*4)*(span-(width/2))).^2);
    g = @(span,height) 2.^(-((1/height*4)*(span-(height/4))).^2);
    
    height = size(image,1);
    width = size(image,2);
    crop_width = width*.25;
    crop_height = height*.5;
    
    %%% Crops Width
    % Creates a scalar function which is used to scale summed pixel value
    span = linspace(1,width,width);
    scalar = f(span,width);

    % Finds the summed pixel values for every column in green monochrome image
    values = sum((image(:,:,2)));
    values = values.*scalar;

    % finds the max of the scaled function
    m = max(values);
    centerpoint = find(values == m);

    % crops the iamge to a preset width around the center point
    cropped_image = imcrop(image,[centerpoint-crop_width/2,0,crop_width,height]);
    
    %%% Crops Height 
    % creates a scalar function to augment
    span = linspace(1,height,height);
    scalar = g(span,height);
    
    % sums and scales the distribution of pixel's values in each column
    values = sum(cropped_image(:,:,2)');
    values = values.*scalar;
    
    % finds the maximum point in the 
    m = max(values);
    index = find(values == m);
    
    % crops the image to a pre set height based upon the max
%     cropped_image = imcrop(cropped_image,[0,index+floor(height/48),width,crop_height]);
    cropped_image = imcrop(cropped_image,[0,index+128,width,crop_height]);
end