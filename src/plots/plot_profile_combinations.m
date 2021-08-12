plot_timeseries_panels(settings, 'sigma_2', timeseries_indices);
plot_timeseries_panels(settings, 'w',       timeseries_indices);
plot_timeseries_panels(settings, 'b_2',     timeseries_indices);
plot_timeseries_panels(settings, 'tke_res', timeseries_indices);
plot_timeseries_panels(settings, 'tke_sg',  timeseries_indices);
plot_timeseries_panels(settings, 'wb_2_res',  timeseries_indices);
plot_timeseries_panels(settings, 'wqv_res', timeseries_indices);
plot_timeseries_panels(settings, 'wqv_sg',  timeseries_indices);

for kt = 1:length(settings.times_to_plot)
    
    % Time
    t = settings.times_to_plot(kt);
    % Find the nearest profiles (in time) for the LES and SCM data
    [SCM.t, i] = min(abs(SCM.times - t));
    
    % 8-panel plot of mean fluid variables
    profiles = {
        'updraftFraction',...
        'verticalVelocity',...
        'potentialTemperature',...
        'updraftBuoyancy',...
        'mixingRatioT',...
        'mixingRatioV',...
        'mixingRatioL',...
        'resolvedBuoyancyFlux'
    };
    profiles_to_plot = {};
    for j=1:length(profiles)
        profiles_to_plot{end+1} = fullfile(settings.folders.figures, join([profiles{j},'_', num2str(i), '.fig'],""));
    end
    filename = join(['meanProfiles_', num2str(i)],"");
    plot_multiple_panels(settings, filename, profiles_to_plot, 4);
    
    
    % 8-panel plot of variances
    profiles = {
        'resolvedTKE',...
        'resolvedWVar',...
        'resolvedThetaVar',...
        'resolvedMixingRatioVar',...
        'subgridTKE',...
        'subgridWVar',...
        'subgridThetaVar',...
        'subgridMixingRatioVar'
    };
    profiles_to_plot = {};
    for j=1:length(profiles)
        profiles_to_plot{end+1} = fullfile(settings.folders.figures, join([profiles{j},'_', num2str(i), '.fig'],""));
    end
    filename = join(['varianceProfiles_', num2str(i)],"");
    plot_multiple_panels(settings, filename, profiles_to_plot, 4);
end