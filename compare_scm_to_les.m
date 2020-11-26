function compare_scm_to_les(settings)
% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

load_les_data
load_scm_data

% Book-keeping and extra variables
additional_diagnostics

if settings.save_figures | settings.save_images
    % Plot each profile for each saved time
    plot_individual_profiles

    % Combine individual profiles for multi-panel plots
    % Requires .fig files to be imported
    if settings.save_figures
        plot_profile_combinations
    end
end

if settings.plot_original_figures
    plot_mean_profiles
    plot_higher_moments
end

% Plot variable changes over time
plot_timeseries

end