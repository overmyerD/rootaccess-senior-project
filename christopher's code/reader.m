rootdir = './senior_project/Run1';
outputdir = './senior_project/Output_test/';
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
        
        % uses canny edge detection on cropped images
        image = canny_algorithm(image);
        % writes the new image to a given directory
        new_filename = strcat(outputdir,name,"_cropped",".JPG");
%         new_filename = strcat(outputdir,string(i),".JPG");
        imwrite(image, new_filename);
        
        %%% analysis of the post canny images
        
        % gets the numerical data of the image
        data = reduce_pixel_density(image);
        % plots the figure and returns a handle to the variable
        h = plot_2Dpixel_density(data,"title",9);
        % saves the individual plot using the handle
        saveas(h,strcat(analysisdir,name,"_2D_analysis"),'jpg');
        
        % returns 3d bar graph, and raw numerical data of 3d bar graph
        [h, raw_3D_data] = plot_3Dpixel_density();  % insert images to be processed
        saveas(h,strcat(analysisdir,name,"_3D_analysis"),'jpg');
        
        % wind rose
        h = windrose_analysis(raw_3D_data);
        saveas(h,strcat(analysisdir,name,"_windrose"),'jpg');
    end
    
    if mod(i,10) == 0
        fprintf("%d out of %d completed\n",i,size(filelist,1))
    end
end

clear;