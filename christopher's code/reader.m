inputdir = './senior_project/032720_18DAP/*.JPG';
outputdir = './senior_project/Output_test/';

% reads in all images in a given directory
ds = imageDatastore(inputdir);

% loops through every image in the directory
for i = 1:size(ds.Files,1)
    if contains(ds.Files{i}, "BF") == 0
        image = read(ds);
        % crops the original image down to a new size
        image = AutoCropper(image);
        
        % insert canny here
        image = canny_algorithm(image);
        
        % insert analysis here
        
        % writes the new image to a given directory
        [filepath,name,ext] = fileparts(ds.Files{i});
        new_filename = strcat(outputdir,name,"_cropped",ext);
        imwrite(image, new_filename);
    end
end