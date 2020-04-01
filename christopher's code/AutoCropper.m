function cropped_image = AutoCropper(image)
    % Predefined parameters
    height = size(image,1);
    width = size(image,2);
    crop_width = 900;
    crop_height = 930;

    % Finds the summed pixel values for every column in green monochrome image
    values = sum((image(:,:,2)));

    % finds a number of local maxima across the distribution and what their
    % indicies are
    TF = islocalmax(values,'MinSeparation',width/8);
    indicies = find(TF == 1);

    % determines the index closest to the middle point of the image
    [~,idx] = min(abs(indicies - width/2));

    % determines the 2nd closest index to middle point
    indicies2 = indicies(indicies~=indicies(idx));
    [~,idx2] = min(abs(indicies2 - width/2));

    % determines which of the two points has more green in a given column
    if values(indicies(idx)) > values(indicies2(idx2))
        centerpoint = indicies(idx);
    else
        centerpoint = indicies2(idx2);
    end

    % crops the iamge to 900px width around the center point
    cropped_image = imcrop(image,[centerpoint-crop_width/2,0,900,height]);
end