function plot_timeseries_panels(settings, name, total)
    % Prepare array with name of files to plot
    profiles_to_plot = {};
    for i=1:total
        file_figure = join([name, '_', num2str(i), '.fig'],"");
        file_figure = fullfile(settings.folders.figures, file_figure);
        profiles_to_plot{end+1} = file_figure;
    end
    
    %Open files and compose into multi-panel figure
    plot_multiple_panels(settings, name, profiles_to_plot, length(profiles_to_plot))
end