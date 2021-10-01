function rmse_mean = compare_scm_to_les(settings)
% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).
plot_compatibility

load_les_data
load_scm_data

% Generic comment
% Book-keeping and extra variables
additional_diagnostics

% Plot each profile for each saved time
if settings.plot_individual_profiles & (settings.save_figures | settings.save_images)
    
    % plot_individual_profiles

    % Combine individual profiles for multi-panel plots
    % Requires .fig files to be imported
    if settings.save_figures & settings.plot_combinations
        % plot_profile_combinations
    end
end

% Plot variable changes over time
plot_timeseries

% Get a measure of the difference between the SCM and LES data
calculate_mean_rmse

end