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

% Calculate RMSE and combine
rmse_sigma = rmse_all_times(times, z, sigma_2, SCM_times, SCM_zp, SCM_sigma2);
rmse_w_2   = rmse_all_times(times, z, w_2,     SCM_times, SCM_zw, SCM_w_2);
rmse_b_2   = rmse_all_times(times, z, b_2,     SCM_times, SCM_zw, SCM_b_2_est);
rmse_e_2   = rmse_all_times(times, z, e_2,     SCM_times, SCM_zw, SCM_e2_res+SCM_e2_sg);
rmse_qv_2  = rmse_all_times(times, z, qv_2,    SCM_times, SCM_zw, SCM_qv_2);
rmse_ql_2  = rmse_all_times(times, z, ql_2,    SCM_times, SCM_zw, SCM_ql_2);
rmse_mean  = (rmse_sigma + rmse_w_2 + rmse_b_2 + rmse_e_2 + rmse_qv_2 + rmse_ql_2)/6;

sprintf('RMSE of sigma2: %d.4f', rmse_sigma);
sprintf('RMSE of     w2: %d.4f', rmse_w_2);
sprintf('RMSE of     b2: %d.4f', rmse_b_2);
sprintf('RMSE of     e2: %d.4f', rmse_e_2);
sprintf('RMSE of    qv2: %d.4f', rmse_qv_2);
sprintf('RMSE of    ql2: %d.4f', rmse_ql_2);
sprintf('RMSE mean     : %d.4f', rmse_mean);

end