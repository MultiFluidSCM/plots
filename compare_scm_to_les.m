function rmse_cloud = compare_scm_to_les(settings)
% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

load_les_data
load_scm_data

% Generic comment
% Book-keeping and extra variables
additional_diagnostics

% Plot variable changes over time
plot_timeseries

% Plot each profile for each saved time
if settings.plot_individual_profiles & (settings.save_figures | settings.save_images)
    
    plot_individual_profiles

    % Combine individual profiles for multi-panel plots
    % Requires .fig files to be imported
    if settings.save_figures & settings.plot_combinations
        plot_profile_combinations
    end
end

if settings.plot_original_figures
    plot_mean_profiles
    plot_higher_moments
end


rmse_cbase = rmse(clbas, interpolate_timeseries(time_ser_hours, SCM_time_ser_hours, SCM_zcbase));
rmse_ctop  = rmse(cltop, interpolate_timeseries(time_ser_hours, SCM_time_ser_hours, SCM_zctop));
rmse_cloud = (rmse_cbase + rmse_ctop)/1e3;

end