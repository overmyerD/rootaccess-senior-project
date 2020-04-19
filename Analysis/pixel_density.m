canny_directory = "./Images/Canny/26DAP";
%canny_images = getFiles(canny_directory, "jpg");

%convert jpg to binary bitmap because it's not already
image_1 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0242.jpg"))));
image_2 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0241.jpg"))));

%reduction must be divisible by width
reduction = 100;

[reduced_pix_density_xyz, reduced_pix_density_xy, reduced_pix_density_zy, magnitude] = reduce_pixel_density_matrix(image_1, image_2, reduction);

[orgin_x, orgin_y] = get_max_xy(reduced_pix_density_xyz);


width = size(reduced_pix_density_xyz, 1);
height = size(reduced_pix_density_xyz, 2);

direction = zeros(1, width*height);
speed = zeros(1, width*height);

for i = 1:width-1
    for j = 1:height-1
        x = i - orgin_x;
        y = j - orgin_y;
        theta = atan2(y, x) * 180 / pi;
        if theta < 0 
            theta = theta + 360;
        end
        direction(i * height + j) = theta;
        speed(i * height + j) = reduced_pix_density_xyz(i, j);
    end
end

%where to place the label, at what angle


load('.\Analysis\options.mat');

save('.\Analysis\options.mat', '-struct', 'Options');
WindRose(direction, speed, Options);

%clear;

function [Options] = set_options
    Options.FreqLabelAngle = 305;
    %number of sectors in the wind rose
    Options.ndirections    = 10;
    Options.radialgridnumber = 10;
    %number of lines from origin to edge of wind rose
    Options.nFreq = 4;
    Options.TitleString = {'Wind Rose 22 DAP'; ''; ''};
    Options.LabLegend = 'Pixel Density';
    Options.min_radius = 0;
    Options.cMap = 'lines';
    Options.LegendType = 2;
    Options.legendvariable = 'P_D';
    %scale of the actual wind rose
    Options.scalefactor = 1;

    %Options.figColor = 'k';
    %Options.textColor = [1 1 0.5];
    %Options.gridColor = 'w';

    % :, -, or --
    Options.gridstyle = '-';
    Options.gridcolor = 'k';
    Options.gridwidth = 1;
    Options.gridalpha = 0.25;

    Options.textfontname = 'Arial Black';
    Options.titlefontname = 'Courier New';
    Options.legendfontname = 'Calibri Light';
end