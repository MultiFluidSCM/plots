% Assume data are at the heights z = zi - dz/2 **CHECK**
% dz = zi(2) - zi(1);
% z = zi - 0.5*dz;

% Estimate updraft buoyancy
SCM_th_mean = SCM_sigma1w.*SCM_th_1 + SCM_sigma2w.*SCM_th_2;
SCM_est_buoy = settings.gravity*(SCM_th_2 - SCM_th_mean)./SCM_th_mean;

% Estimate resolved buoyancy flux
% buoy_flux_res = (w_2 - w_1).*sigma2.*buoy;
SCM_buoy_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_est_buoy;

% Estimate resolved moisture flux
SCM_q_mean = SCM_sigma1w.*(SCM_qv_1+SCM_ql_1) + SCM_sigma2w.*(SCM_qv_2+SCM_ql_2);
SCM_q_pert = SCM_qv_2 + SCM_ql_2 - SCM_q_mean;
SCM_moisture_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_q_pert;
LES_moisture_flux_res = (LES_w_2 - LES_w_1).*LES_sigma_2.*(LES_q_2 - LES_q);

% Estimate resolved vapour flux
SCM_qv_mean = SCM_sigma1w.*SCM_qv_1 + SCM_sigma2w.*SCM_qv_2;
SCM_vapour_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*(SCM_qv_2 - SCM_qv_mean);
LES_vapour_flux_res = (LES_w_2 - LES_w_1).*LES_sigma_2.*(LES_qv_2 - LES_qv);

% Estimate resolved liquid flux
SCM_ql_mean = SCM_sigma1w.*SCM_ql_1 + SCM_sigma2w.*SCM_ql_2;
SCM_liquid_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*(SCM_ql_2 - SCM_ql_mean);
LES_liquid_flux_res = (LES_w_2 - LES_w_1).*LES_sigma_2.*(LES_ql_2 - LES_ql);

% Calculate mixing ratios from specific humidities
SCM_rv_1 = SCM_qv_1./(1-SCM_qv_1);
SCM_rv_2 = SCM_qv_2./(1-SCM_qv_2);
SCM_rv_mean = SCM_qv_mean./(1-SCM_qv_mean);
SCM_rl_1 = SCM_ql_1./(1-SCM_ql_1);
SCM_rl_2 = SCM_ql_2./(1-SCM_ql_2);
SCM_rl_mean = SCM_ql_mean./(1-SCM_ql_mean);

% Virtual potential temperature and buoyancy
SCM_thv_1 = SCM_th_1.*(1 + 0.61*SCM_rv_1 - SCM_rl_1);
SCM_thv_2 = SCM_th_2.*(1 + 0.61*SCM_rv_2 - SCM_rl_2);
SCM_thv_mean = SCM_th_mean.*(1 + 0.61*SCM_rv_mean - SCM_rl_mean);

% Estimate of the buoyancy
SCM_b_2_est = settings.gravity*(SCM_thv_2 - SCM_thv_mean)./SCM_thv_mean;

% Total TKE
SCM_e_1 = SCM_e1_res+SCM_e1_sg;
SCM_e_2 = SCM_e2_res+SCM_e2_sg;