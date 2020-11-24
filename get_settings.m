function [ settings ] = get_settings(folders)
    settings.folders = folders;

    % Gravitational acceleration
    settings.gravity = 9.806;

    % Figure font size
    settings.fs = 18;

    % Top of plots
    settings.zplottop = 4000;
    
    % Save figures as .fig files?
    settings.save_figures = true;
    
    % Save figures as .png files?
    settings.save_images = true;
    
    % Indicate location of cloud base in 1D profiles?
    settings.indicate_cloud_base = true;
end