rootdir = './senior_project/040120 testing';
outputdir = './senior_project/Output_test2/';

filelist = dir(fullfile(rootdir, '**/*.JPG'));  %get list of files and folders in any subfolder
filelist = filelist(~[filelist.isdir]);  %remove folders from list

% reads in all images in a given directory
% ds = imageDatastore(filelist.folder);

% loops through every image in the directory, skipping brightfield images
for i = 1:size(filelist,1)
    if contains(filelist(i).name, "BF") == 0 && contains(filelist(i).name, "white") == 0
        image_name = strcat(filelist(i).folder,"/",filelist(i).name);
        image = imread(image_name);
        % crops the original image down to a new size
        image = AutoCropper(image);
        
        % insert canny here
        image = canny_algorithm(image);
        
        % insert analysis heres
        
        % writes the new image to a given directory
        new_filename = strcat(outputdir,filelist(i).name,"_cropped",".JPG");
        imwrite(image, new_filename);
    end
end