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

% Data to be used for calculating the RMS error relative to LES data
SCM_s2_corr = SCM_sigma2(:,3);
SCM_w2_corr = SCM_w_2(:,3);
SCM_q2_corr = SCM_ql_2(:,3);
SCM_cb_corr = SCM_zcbase(:);
SCM_ct_corr = SCM_zctop(:);
SCM_cc_corr = SCM_cldcov(:);

% Remove NaN values
SCM_s2_corr(isnan(SCM_s2_corr)) = 0;
SCM_w2_corr(isnan(SCM_w2_corr)) = 0;
SCM_q2_corr(isnan(SCM_q2_corr)) = 0;
SCM_cb_corr(isnan(SCM_cb_corr)) = 0;
SCM_ct_corr(isnan(SCM_ct_corr)) = 0;
SCM_cc_corr(isnan(SCM_cc_corr)) = 0;

% Calculate RMSE and combine
rmse_cbase = rmse(clbas, interpolate_timeseries(time_ser_hours, SCM_time_ser_hours, SCM_cb_corr))/max(clbas);
rmse_ctop  = rmse(cltop, interpolate_timeseries(time_ser_hours, SCM_time_ser_hours, SCM_ct_corr)) /max(cltop);
rmse_ccov  = rmse(totc,  interpolate_timeseries(time_ser_hours, SCM_time_ser_hours, SCM_cc_corr))/max(totc);
rmse_sigma = rmse(sigma2(1:140,3), interpolate_timeseries(z(1:140), SCM_zp, SCM_s2_corr))/max(sigma2(1:140,3));
rmse_w2    = rmse(   w_2(1:140,3), interpolate_timeseries(z(1:140), SCM_zw, SCM_w2_corr))/max(   w_2(1:140,3));
rmse_ql2   = rmse(  ql_2(1:140,3), interpolate_timeseries(z(1:140), SCM_zw, SCM_q2_corr))/max(  ql_2(1:140,3));

% rmse_cloud = (rmse_cbase + rmse_ctop + rmse_ccov + rmse_sigma + rmse_w2 + rmse_ql2)/6;
% rmse_cloud = (rmse_cbase + rmse_ctop + 3*rmse_sigma)/5;
% rmse_cloud = (rmse_cbase + rmse_ctop + rmse_sigma)/3;
% rmse_cloud = (rmse_cbase + rmse_ctop + rmse_ccov + rmse_sigma)/4;
% rmse_cloud = (rmse_cbase + rmse_ctop + rmse_ccov)/3;
rmse_cloud = (rmse_cbase + rmse_ctop)/2;

end