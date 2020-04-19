function h = windrose_analysis(raw_3D_data)
    h = figure('visible','off');
    maximum = max(max(raw_3D_data));
    [orgin_x,orgin_y]=find(raw_3D_data==maximum);
    width = size(raw_3D_data, 1);
    height = size(raw_3D_data, 2);

    direction = zeros(1, width*height);
    speed = zeros(1, width*height);

    for i = 1:width-1
        for j = 1:height-1
            x = i - orgin_x;
            y = j - orgin_y;
            theta = atan2(y, x) * 180 / pi;
            if theta < 0
                theta = theta + 360;
            end
            direction(i * height + j) = theta;
            speed(i * height + j) = raw_3D_data(i, j);
        end
    end
    load options.mat;
    WindRose(direction, speed, Options);
end