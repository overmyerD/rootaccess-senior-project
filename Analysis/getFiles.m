function [outputFiles] = getFiles(directory, extention)
%GETFILES 
%   Outputs a cell of filenames given a directory and an extension
    outputFiles = {dir(directory + "/*." + extention).name};
end
