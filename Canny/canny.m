[filename,filepath] = uigetfile({'*.*;*.jpg;*.png;*.bmp;*.oct'}, 'Select File to Open');
fullname = string([filepath, filename]);
app.loadedImage = rgb2gray(imread(fullname));
BW1 = edge(rgb2gray(imread(fullname)), 'Canny', [0.1, 0.5], 1);


imshow(BW1);