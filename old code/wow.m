canny_directory = "./Images/Canny/26DAP";
yxBinaryImage = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0242.jpg"))));
yzBinaryImage = imbinarize(rgb2gray(imread(strcat(canny_directory, "/0241.jpg"))));
barWidth_xyz = [10 10 10];
figureTitle = '';
opName = '';

yxsize = size(yxBinaryImage);
yzsize = size(yzBinaryImage);
barWidth_x = barWidth_xyz(1, 1);
barWidth_y = barWidth_xyz(1, 2);
barWidth_z = barWidth_xyz(1, 3);


x = yxsize(1, 2);
y_x = yxsize(1, 1);
y_z = yzsize(1, 1);
z = yzsize(1, 2);
xlength = (1:x);
ylength_x = (1:y_x);
ylength_z = (1:y_z);
zlength = (1:z);
xcount = zeros(1, x);
ycount_x = zeros(1, y_x);
ycount_z = zeros(1, y_z);
zcount = zeros(1, z);
y_avg = max([y_x, y_z]);
ycount_avg = zeros(1, y_avg);
ylength_avg = (1:y_avg);

for n=1:x
    for m = 1:y_x
        if(yxBinaryImage(m, n) > 0)
            xcount(1, n) = xcount(1, n) + 1;
        end
    end
end

for m = 1:y_x
    for n=1:x
        if(yxBinaryImage(m, n) > 0)
            ycount_x(1, m) = ycount_x(1, m) + 1;
        end
    end
end

for m = 1:y_z
    for n=1:z
        if(yzBinaryImage(m, n) > 0)
            ycount_z(1, m) = ycount_z(1, m) + 1;
        end
    end
end

for n=1:z
    for m = 1:y_z
        if(yzBinaryImage(m, n) > 0)
            zcount(1, n) = zcount(1, n) + 1;
        end
    end
end

for n=1:min([y_x, y_z])
    ycount_avg(1, n) = (ycount_x(1, n) + ycount_z(1, n)) / 2;
end
if(y_x == y_avg)
    ycount_avg(y_z + 1 : y_x) = ycount_x(y_z + 1 : y_x);
else
    if(y_z == y_avg)
        ycount_avg(y_x + 1 : y_z) = ycount_z(y_x + 1 : y_z);
    end
end

h = figure;
plot(xlength, xcount);
title(strcat(figureTitle, ' - x graph'));
xlabel('X');
ylabel('Number of Pixels');
set(gca,'XLim',[0, x]);
print(h, '-dbmp', strcat(opName, '_x_plot.bmp'));

h = figure;
plot(ylength_x, ycount_x);
title(strcat(figureTitle, ' - y graph on x face'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, y_x]);
print(h, '-dbmp', strcat(opName, '_y-x_plot.bmp'));

h = figure;
plot(ylength_z, ycount_z);
title(strcat(figureTitle, ' - y graph on z face'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, y_z]);
print(h, '-dbmp', strcat(opName, '_y-z_plot.bmp'));

h = figure;
plot(zlength, zcount);
title(strcat(figureTitle, ' - z graph'));
xlabel('Z');
ylabel('Number of Pixels');
set(gca,'XLim',[0, z]);
print(h, '-dbmp', strcat(opName, '_z_plot.bmp'));

h = figure;
plot(ylength_avg, ycount_avg);
title(strcat(figureTitle, ' - y graph - avg'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, max(y_x, y_z)]);
print(h, '-dbmp', strcat(opName, '_y-avg_plot.bmp'));


xbar = ceil(double(x) / double(barWidth_x));
ybar_x = ceil(double(y_x) / double(barWidth_y));
ybar_z = ceil(double(y_z) / double(barWidth_y));
zbar = ceil(double(z) / double(barWidth_z));
xbar_length = (1:barWidth_x:x);
ybar_length_x = (1:barWidth_y:y_x);
ybar_length_z = (1:barWidth_y:y_z);
zbar_length = (1:barWidth_z:z);
xcount_bar = zeros(1, xbar);
ycount_x_bar = zeros(1, ybar_x);
ycount_z_bar = zeros(1, ybar_z);
zcount_bar = zeros(1, zbar);
ybar_avg = max([ybar_x, ybar_z]);
ybar_length_avg = (1:barWidth_y:max(y_x, y_z));
ycount_avg_bar = zeros(1, ybar_avg);

for n=1:x
    for m = 1:y_x
        if(yxBinaryImage(m, n) > 0)
            xcount_bar(1, ceil(double(n) / double(barWidth_x))) = xcount_bar(1, ceil(double(n) / double(barWidth_x))) + 1;
        end
    end
end

for m = 1:y_x
    for n=1:x
        if(yxBinaryImage(m, n) > 0)
            ycount_x_bar(1, ceil(double(m) / double(barWidth_y))) = ycount_x_bar(1, ceil(double(m) / double(barWidth_y))) + 1;
        end
    end
end

for m = 1:y_z
    for n=1:z
        if(yzBinaryImage(m, n) > 0)
            ycount_z_bar(1, ceil(double(m) / double(barWidth_y))) = ycount_z_bar(1, ceil(double(m) / double(barWidth_y))) + 1;
        end
    end
end

for n=1:z
    for m = 1:y_z
        if(yzBinaryImage(m, n) > 0)
            zcount_bar(1, ceil(double(n) / double(barWidth_z))) = zcount_bar(1, ceil(double(n) / double(barWidth_z))) + 1;
        end
    end
end

for n = 1:min([ybar_x, ybar_z])
    ycount_avg_bar(1, n) = (ycount_x_bar(1, n) + ycount_z_bar(1, n)) / 2;
end
if(ybar_x == ybar_avg)
    ycount_avg_bar(ybar_z + 1 : ybar_x) = ycount_x_bar(ybar_z + 1 : ybar_x);
else
    if(ybar_z == ybar_avg)
        ycount_avg_bar(ybar_x + 1 : ybar_z) = ycount_z_bar(ybar_x + 1 : ybar_z);
    end
end
    

h = figure;
bar(xbar_length, xcount_bar);
title(strcat(figureTitle, ' - x graph'));
xlabel('X');
ylabel('Number of Pixels');
set(gca,'XLim',[0, x]);
print(h, '-dbmp', strcat(opName, '_x_bar.bmp'));

h = figure;
bar(ybar_length_x, ycount_x_bar);
title(strcat(figureTitle, ' - y graph on x face'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, y_x]);
print(h, '-dbmp', strcat(opName, '_y-x_bar.bmp'));

h = figure;
bar(ybar_length_z, ycount_z_bar);
title(strcat(figureTitle, ' - y graph on z face'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, y_z]);
print(h, '-dbmp', strcat(opName, '_y-z_bar.bmp'));

h = figure;
bar(zbar_length, zcount_bar);
title(strcat(figureTitle, ' - z graph'));
xlabel('Z');
ylabel('Number of Pixels');
set(gca,'XLim',[0, z]);
print(h, '-dbmp', strcat(opName, '_z_bar.bmp'));

h = figure;
bar(ybar_length_avg, ycount_avg_bar);
title(strcat(figureTitle, ' - y graph - avg'));
xlabel('Y');
ylabel('Number of Pixels');
set(gca,'XLim',[0, max(y_x, y_z)]);
print(h, '-dbmp', strcat(opName, '_y-avg_bar.bmp'));


xcount_bar_max = max(xcount_bar);
xcount_bar_normalised = xcount_bar ./ xcount_bar_max;
zcount_bar_max = max(zcount_bar);
zcount_bar_normalised = zcount_bar ./ zcount_bar_max;
xz = xcount_bar_normalised' * zcount_bar_normalised;
h = figure;
bar3(xz);
title(strcat(figureTitle, ' - xz graph'));
xlabel('Z');
ylabel('X');
zlabel('Density Distribution of Pixels');
set(gca, 'XTick', (1:3:zbar));
set(gca, 'YTick', (1:3:xbar));
set(gca, 'XTickLabel', (barWidth_z:3*barWidth_z:z));
set(gca, 'YTickLabel', (barWidth_x:3*barWidth_x:x));
print(h, '-dbmp', strcat(opName, '_xz_3Dbar.bmp'));
