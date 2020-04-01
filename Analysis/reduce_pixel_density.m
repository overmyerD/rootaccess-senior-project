function [reduced_pix_density] = reduce_pixel_density(pix_density, reduction)
%REDUCE_PIXEL_DENSITY Takes a binary image and calculates pixel density in
%each column.
%
reduced_pix_density = sum(reshape(pix_density, idivide(length(pix_density), int16(reduction)),[])).';
end

