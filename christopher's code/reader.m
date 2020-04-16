rootdir = './senior_project/tstr';
outputdir = './senior_project/output/';
analysisdir = './senior_project/Analysis_test/';

filelist = dir(fullfile(rootdir, '**/*.JPG'));  %get list of files and folders in any subfolder
filelist = filelist(~[filelist.isdir]);  %remove folders from list

% loops through every image in the directory, skipping brightfield images
for i = 1:size(filelist,1)
    if contains(filelist(i).name, "BF") == 0 && contains(filelist(i).name, "white") == 0
        % get info about the filename and reads in image
        [filepath,name,ext] = fileparts(filelist(i).name);
        image_name = strcat(filelist(i).folder,"/",filelist(i).name);
        image = imread(image_name);
        
        % crops the original image down to a new size
        image = AutoCropper(image);
        
        % insert canny here
        image = canny_algorithm(image);
        
        % insert analysis heres
% %         data = reduce_pixel_density(image);
% %         h = plot_pixel_density(data,"title",9);
% %         saveas(h,strcat(analysisdir,name,"_analysis"),'jpg');
        
        % writes the new image to a given directory
        new_filename = strcat(outputdir,name,"_cropped",".JPG");
        imwrite(image, new_filename);
    end
end

clear