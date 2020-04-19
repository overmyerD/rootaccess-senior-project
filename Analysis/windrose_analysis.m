function h = windrose_analysis(input)
    [orgin_x, orgin_y] = get_max_xy(reduced_pix_density_xyz);
    width = size(reduced_pix_density_xyz, 1);
    height = size(reduced_pix_density_xyz, 2);

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
            speed(i * height + j) = reduced_pix_density_xyz(i, j);
        end
    end
    load options.mat;
    WindRose(direction, speed, Options);
end