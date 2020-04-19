function [x, y] = get_max_xy(matrix)
%GET_MAX_XY Summary of this function goes here
    maximum = max(max(matrix));
    [x,y]=find(matrix==maximum);
end

