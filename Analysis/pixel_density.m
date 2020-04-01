canny_directory = "./Images/Canny/21DAP";
%canny_images = getFiles(canny_directory, "jpg");

image = imread(strcat(canny_directory, "/0189.jpg"));

%convert jpg to binary bitmap because it's not already
image = imbinarize(rgb2gray(image));

%get width and height of image
width   = size(image, 2);
height  = size(image, 1);

%sum the columns into 1D arr
pix_density = sum(image).';
plot_pixel_density(pix_density, 'Root Density', 1);

%reduction must be divisible by width
reduction = 100;

%reshape to 2D and sum again to 1D arr
reduced_pix_density = reduce_pixel_density(pix_density, reduction);

scale = idivide(length(pix_density), int16(reduction));
plot_pixel_density(reduced_pix_density, 'Root Density', scale);

