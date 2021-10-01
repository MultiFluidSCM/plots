% Assume data are at the heights z = zi - dz/2 **CHECK**
% dz = zi(2) - zi(1);
% z = zi - 0.5*dz;

% Estimate updraft buoyancy
SCM.th_mean = SCM.sigma1w.*SCM.th_1 + SCM.sigma2w.*SCM.th_2;
SCM.est_buoy = settings.gravity*(SCM.th_2 - SCM.th_mean)./SCM.th_mean;

% Estimate resolved buoyancy flux
% buoy_flux_res = (w_2 - w_1).*sigma2.*buoy;
SCM.buoy_flux_res = (SCM.w_2 - SCM.w_1).*SCM.sigma2w.*SCM.est_buoy;

% Estimate resolved moisture flux
SCM.q_mean = SCM.sigma1w.*(SCM.qv_1+SCM.ql_1) + SCM.sigma2w.*(SCM.qv_2+SCM.ql_2);
SCM.q_pert = SCM.qv_2 + SCM.ql_2 - SCM.q_mean;
SCM.moisture_flux_res = (SCM.w_2 - SCM.w_1).*SCM.sigma2w.*SCM.q_pert;
LES.moisture_flux_res = (LES.w_2 - LES.w_1).*LES.sigma_2.*(LES.q_2 - LES.q);

% Estimate resolved vapour flux
SCM.qv_mean = SCM.sigma1w.*SCM.qv_1 + SCM.sigma2w.*SCM.qv_2;
SCM.vapour_flux_res = (SCM.w_2 - SCM.w_1).*SCM.sigma2w.*(SCM.qv_2 - SCM.qv_mean);
LES.vapour_flux_res = (LES.w_2 - LES.w_1).*LES.sigma_2.*(LES.qv_2 - LES.qv);

% Estimate resolved liquid flux
SCM.ql_mean = SCM.sigma1w.*SCM.ql_1 + SCM.sigma2w.*SCM.ql_2;
SCM.liquid_flux_res = (SCM.w_2 - SCM.w_1).*SCM.sigma2w.*(SCM.ql_2 - SCM.ql_mean);
LES.liquid_flux_res = (LES.w_2 - LES.w_1).*LES.sigma_2.*(LES.ql_2 - LES.ql);

% Calculate mixing ratios from specific humidities
SCM.rv_1 = SCM.qv_1./(1-SCM.qv_1);
SCM.rv_2 = SCM.qv_2./(1-SCM.qv_2);
SCM.rv_mean = SCM.qv_mean./(1-SCM.qv_mean);
SCM.rl_1 = SCM.ql_1./(1-SCM.ql_1);
SCM.rl_2 = SCM.ql_2./(1-SCM.ql_2);
SCM.rl_mean = SCM.ql_mean./(1-SCM.ql_mean);

% Virtual potential temperature and buoyancy
SCM.thv_1 = SCM.th_1.*(1 + 0.61*SCM.rv_1 - SCM.rl_1);
SCM.thv_2 = SCM.th_2.*(1 + 0.61*SCM.rv_2 - SCM.rl_2);
SCM.thv_mean = SCM.th_mean.*(1 + 0.61*SCM.rv_mean - SCM.rl_mean);

% Estimate of the buoyancy
SCM.b_2_est = settings.gravity*(SCM.thv_2 - SCM.thv_mean)./SCM.thv_mean;

% Total TKE and variance
SCM.e_1 = SCM.e1_res + SCM.e1_sg;
SCM.e_2 = SCM.e2_res + SCM.e2_sg;
SCM.ww_res1 = SCM.ww1;
SCM.ww_res2 = SCM.ww2;
% SCM.ww_1 = SCM.ww_res1 + SCM.ww_sg1;
% SCM.ww_2 = SCM.ww_res2 + SCM.ww_sg2;