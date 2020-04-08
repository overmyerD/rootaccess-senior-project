function [reduced_pix_density_matrix, reduced_pix_density_1, reduced_pix_density_2, magnitude] = reduce_pixel_density_matrix(binaryImage1, binaryImage2, reduction)
%REDUCE_PIXEL_DENSITY_MATRIX 
    [reduced_pix_density_1, magnitude] = reduce_pixel_density(binaryImage1, reduction);
    reduced_pix_density_2 = reduce_pixel_density(binaryImage2, reduction);
    
    reduced_pix_density_matrix = reduced_pix_density_1.' * reduced_pix_density_2;
end


