canny_directory = "./Images/Canny/26DAP";
%canny_images = getFiles(canny_directory, "jpg");

%convert jpg to binary bitmap because it's not already
image_1 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0242.jpg"))));
image_2 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0241.jpg"))));

%reduction must be divisible by width
reduction = 100;

[reduced_pix_density_xyz, reduced_pix_density_xy, reduced_pix_density_zy, magnitude] = reduce_pixel_density_matrix(image_1, image_2, reduction);

plot_pixel_density(reduced_pix_density_zy, "pixel density", magnitude);

[orgin_x, orgin_y] = get_max_xy(reduced_pix_density_xyz);


width = size(reduced_pix_density_xyz, 1);
height = size(reduced_pix_density_xyz, 2);

direction = zeros(1, width*height);
speed = zeros(1, width*height);

% for i = 1:width
%     for j = 1:height
%         x = i - orgin_x;
%         y = j - orgin_y;
%         theta = atan2(y, x) * 180 / pi;
%         if theta < 0 
%             theta = theta + 360;
%         end
%         direction(i * height + j) = theta;
%         speed(i * height + j) = reduced_pix_density_xyz(i, j);
%     end
% end
% 
bar3(reduced_pix_density_xyz);
% Options.AngleNorth     = 0;
% Options.AngleEast      = 90;
% Options.FreqLabelAngle = 10;
% Options.ndirections = 25;
% WindRose(direction, speed,Options);


