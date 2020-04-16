function [reduced_pix_density, magnitude] = reduce_pixel_density(binaryImage, reduction)
%REDUCE_PIXEL_DENSITY 
%Takes a binary image and calculates pixel density in each column and uses reduction to remove noise. 
%Reduction must be devisibile by the width of the binary image. (1 - width)
%returns reduced_pix_density, which is a 1D array
%returns magnitude, which is the magnitude in which it was reduced to.

pix_density = sum(binaryImage);
width = length(pix_density);

if mod(width, reduction) ~= 0
    errorStruct.message = 'image width is not divisble by reduction!';
    errorStruct.identifier = 'reduce_pixel_density:InvalidInput';
    error(errorStruct);
end

magnitude = idivide(width, int16(reduction));
reduced_pix_density = sum(reshape(pix_density, magnitude,[]));
end

