% The weighting for the relative RMSE of each variable
weight_sigma_2 = 1;
weight_w_2     = 1;
weight_b_2     = 1;
weight_e_2     = 1;
weight_q_2     = 1;
weight_qv_2    = 0;
weight_ql_2    = 1;
weight_cloud   = 0;

% weight_sigma_2 = 3;
% weight_w_2     = 0;
% weight_b_2     = 0;
% weight_e_2     = 0;
% weight_q_2     = 0;
% weight_qv_2    = 0;
% weight_ql_2    = 0;
% weight_cloud   = 1;


% Experimental feature to use sigma-weighted variables for the RMS analysis
% This may help remove biases due to single plumes at the cloud top in the LES data
if settings.sigma_weighted_rmse
    LES.w_2  = LES.w_2 .*LES.sigma_2;
    LES.b_2  = LES.b_2 .*LES.sigma_2;
    LES.e_2  = LES.e_2 .*LES.sigma_2;
    LES.q_2  = LES.q_2 .*LES.sigma_2;
    LES.qv_2 = LES.qv_2.*LES.sigma_2;
    LES.ql_2 = LES.ql_2.*LES.sigma_2;

    SCM.w_2      = SCM.w_2     .*SCM.sigma2w;
    SCM.b_2_est  = SCM.b_2_est .*SCM.sigma2w;
    SCM.e_2      = SCM.e_2     .*SCM.sigma2;
    SCM.q_2      = SCM.q_2     .*SCM.sigma2w;
    SCM.qv_2     = SCM.qv_2    .*SCM.sigma2w;
    SCM.ql_2     = SCM.ql_2    .*SCM.sigma2w;
end

% Calculate relative RMSE
rmse_sigma_2 = rmse_all_times(LES.times, LES.z, LES.sigma_2, SCM.times, SCM.zp, SCM.sigma2);
rmse_w_2     = rmse_all_times(LES.times, LES.z, LES.w_2,     SCM.times, SCM.zw, SCM.w_2);
rmse_b_2     = rmse_all_times(LES.times, LES.z, LES.b_2,     SCM.times, SCM.zw, SCM.b_2_est);
rmse_e_2     = rmse_all_times(LES.times, LES.z, LES.e_2,     SCM.times, SCM.zp, SCM.e_2);
rmse_q_2     = rmse_all_times(LES.times, LES.z, LES.q_2,     SCM.times, SCM.zw, SCM.q_2);
rmse_qv_2    = rmse_all_times(LES.times, LES.z, LES.qv_2,    SCM.times, SCM.zw, SCM.qv_2);
rmse_ql_2    = rmse_all_times(LES.times, LES.z, LES.ql_2,    SCM.times, SCM.zw, SCM.ql_2);
rmse_cloud   = rmse_all_times( ...
    transpose(LES.t_cloud_fraction),      ...
    transpose(LES.z_cloud_fraction),      ...
    LES.cloud_fraction,        ...
    transpose(SCM.time_ser),        ...
    SCM.zw,                    ...
    SCM.cloud_fraction         ...
);

% Combine diagnostics
rmse_mean  = ( ...
    weight_sigma_2 * rmse_sigma_2 + ...
    weight_w_2     * rmse_w_2     + ...
    weight_b_2     * rmse_b_2     + ...
    weight_e_2     * rmse_e_2     + ...
    weight_q_2     * rmse_q_2     + ...
    weight_qv_2    * rmse_qv_2    + ...
    weight_ql_2    * rmse_ql_2    + ...
    weight_cloud   * rmse_cloud     ...
)/( ...
    weight_sigma_2 + ...
    weight_w_2     + ...
    weight_b_2     + ...
    weight_e_2     + ...
    weight_q_2     + ...
    weight_qv_2    + ...
    weight_ql_2    + ...
    weight_cloud     ...
);

disp(sprintf('RMSE of sigma_2: %0.4f', rmse_sigma_2));
disp(sprintf('RMSE of     w_2: %0.4f', rmse_w_2));
disp(sprintf('RMSE of     b_2: %0.4f', rmse_b_2));
disp(sprintf('RMSE of     e_2: %0.4f', rmse_e_2));
disp(sprintf('RMSE of     q_2: %0.4f', rmse_q_2));
disp(sprintf('RMSE of    qv_2: %0.4f', rmse_qv_2));
disp(sprintf('RMSE of    ql_2: %0.4f', rmse_ql_2));
disp(sprintf('RMSE of   cloud: %0.4f', rmse_cloud));
disp(sprintf('RMSE mean      : %0.4f', rmse_mean));

% Write RMS error to file
fileID = fopen(fullfile(settings.folders.data_scm, 'rmse.txt'), 'w');
fprintf(fileID, '%12f', rmse_mean);
fclose(fileID);