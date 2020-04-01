function [ret_bar] = plot_pixel_density(reduced_pix_density, g_title, xtick_scale)
    %PLOT_PIXEL_DENSITY Plots the root pixel density into a histogram like
    %bar graph.
    ret_bar = figure;
    l_length = length(reduced_pix_density);
    range = (1:l_length);
    bar(range, reduced_pix_density);
    title(g_title);
    xlabel('X');
    ylabel('Number of Pixels');

    %TODO: doesn't work if scaled with mouse wheel
    xticks = get(gca,'xtick');
    newlabels = arrayfun(@(range) sprintf('%d', range * xtick_scale), xticks, 'un', 0);
    set(gca, 'xticklabel', newlabels);
end

