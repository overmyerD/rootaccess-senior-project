function [h, raw_3D_data] = plot_3Dpixel_density(image1_data, image2_data)
    % takes two numerical data and combines them into a 3D graph
    raw_3D_data = image1_data.' * image2_data;

    h = bar3(reduced_pix_density_xyz);
end