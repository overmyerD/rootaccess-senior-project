canny_directory = "./Images/Canny/26DAP";
%canny_images = getFiles(canny_directory, "jpg");

%convert jpg to binary bitmap because it's not already
image_1 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0242.jpg"))));
image_2 = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0241.jpg"))));

%reduction must be divisible by width
reduction = 100;

[reduced_pix_density_xyz, reduced_pix_density_xy, reduced_pix_density_zy, magnitude] = reduce_pixel_density_matrix(image_1, image_2, reduction);

bar3(reduced_pix_density_xyz);
plot_pixel_density(reduced_pix_density_zy, 'zy pixel density', magnitude);
plot_pixel_density(reduced_pix_density_xy, 'xy pixel density', magnitude);

