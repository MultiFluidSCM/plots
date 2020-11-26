plot_timeseries_panels(settings, 'updraftBuoyancy', 4);
plot_timeseries_panels(settings, 'updraftFraction', 4);
plot_timeseries_panels(settings, 'verticalVelocity', 4);
plot_timeseries_panels(settings, 'resolvedMoistureFlux', 4);
plot_timeseries_panels(settings, 'resolvedVapourFlux', 4);
plot_timeseries_panels(settings, 'resolvedLiquidFlux', 4);
plot_timeseries_panels(settings, 'resolvedTemperatureFluxes', 4);
plot_timeseries_panels(settings, 'resolvedTemperatureMoistFluxes', 4);
plot_timeseries_panels(settings, 'subgridTemperatureFluxes', 4);
plot_timeseries_panels(settings, 'subgridTemperatureMoistFluxes', 4);
plot_timeseries_panels(settings, 'additionalForcing', 4);

for i = 1:length(time_s)
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