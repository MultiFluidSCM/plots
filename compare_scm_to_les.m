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

% Experimental feature to use sigma-weighted variables for the RMS analysis
% This may help remove biases due to single plumes at the cloud top in the LES data
if false
    LES_w_2  = LES_w_2 .*LES_sigma_2;
    LES_b_2  = LES_b_2 .*LES_sigma_2;
    LES_e_2  = LES_e_2 .*LES_sigma_2;
    LES_qv_2 = LES_qv_2.*LES_sigma_2;
    LES_ql_2 = LES_ql_2.*LES_sigma_2;

    SCM_w_2  = SCM_w_2     .*SCM_sigma2w;
    SCM_b_2  = SCM_b_2_est .*SCM_sigma2w;
    SCM_e_2  = SCM_e_2     .*SCM_sigma2;
    SCM_qv_2 = SCM_qv_2    .*SCM_sigma2w;
    SCM_ql_2 = SCM_ql_2    .*SCM_sigma2w;
end

% Calculate RMSE and combine
rmse_sigma = rmse_all_times(LES_times, LES_z, LES_sigma_2, SCM_times, SCM_zp, SCM_sigma2);
rmse_w_2   = rmse_all_times(LES_times, LES_z, LES_w_2,     SCM_times, SCM_zw, SCM_w_2);
rmse_b_2   = rmse_all_times(LES_times, LES_z, LES_b_2,     SCM_times, SCM_zw, SCM_b_2_est);
rmse_e_2   = rmse_all_times(LES_times, LES_z, LES_e_2,     SCM_times, SCM_zp, SCM_e_2);
rmse_qv_2  = rmse_all_times(LES_times, LES_z, LES_qv_2,    SCM_times, SCM_zw, SCM_qv_2);
rmse_ql_2  = rmse_all_times(LES_times, LES_z, LES_ql_2,    SCM_times, SCM_zw, SCM_ql_2);
rmse_mean  = (rmse_sigma + rmse_w_2 + rmse_b_2 + rmse_e_2 + rmse_qv_2 + rmse_ql_2)/6;

disp(sprintf('RMSE of sigma_2: %0.4f', rmse_sigma));
disp(sprintf('RMSE of     w_2: %0.4f', rmse_w_2));
disp(sprintf('RMSE of     b_2: %0.4f', rmse_b_2));
disp(sprintf('RMSE of     e_2: %0.4f', rmse_e_2));
disp(sprintf('RMSE of    qv_2: %0.4f', rmse_qv_2));
disp(sprintf('RMSE of    ql_2: %0.4f', rmse_ql_2));
disp(sprintf('RMSE mean      : %0.4f', rmse_mean));

end