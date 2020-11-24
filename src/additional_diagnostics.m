% Assume data are at the heights z = zi - dz/2 **CHECK**
dz = zi(2) - zi(1);
z = zi - 0.5*dz;

% Non-updraft fraction
sigma1 = 1 - sigma2;
% and liquid water
ql_1 = (ql_tot - sigma2.*ql_2)./sigma1;

% Estimate updraft buoyancy
th_mean = sigma1.*th_1 + sigma2.*th_2;
buoy = settings.gravity*(th_2 - th_mean)./th_mean;
SCM_th_mean = SCM_sigma1w.*SCM_th_1 + SCM_sigma2w.*SCM_th_2;
SCM_est_buoy = settings.gravity*(SCM_th_2 - SCM_th_mean)./SCM_th_mean;

% Estimate resolved buoyancy flux
buoy_flux_res = (w_2 - w_1).*sigma2.*buoy;
SCM_buoy_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_est_buoy;

% Estimate resolved moisture flux
q_mean = sigma1.*(qv_1+ql_1) + sigma2.*(qv_2+ql_2);
q_pert = qv_2 + ql_2 - q_mean;
moisture_flux_res = (w_2 - w_1).*sigma2.*q_pert;

SCM_q_mean = SCM_sigma1w.*(SCM_qv_1+SCM_ql_1) + SCM_sigma2w.*(SCM_qv_2+SCM_ql_2);
SCM_q_pert = SCM_qv_2 + SCM_ql_2 - SCM_q_mean;
SCM_moisture_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_q_pert;

% Estimate resolved vapour flux
qv_mean = sigma1.*qv_1 + sigma2.*qv_2;
vapour_flux_res = (w_2 - w_1).*sigma2.*(qv_2 - qv_mean);

SCM_qv_mean = SCM_sigma1w.*SCM_qv_1 + SCM_sigma2w.*SCM_qv_2;
SCM_vapour_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*(SCM_qv_2 - SCM_qv_mean);

% Estimate resolved liquid flux
ql_mean = sigma1.*ql_1 + sigma2.*ql_2;
liquid_flux_res = (w_2 - w_1).*sigma2.*(ql_2 - ql_mean);

SCM_ql_mean = SCM_sigma1w.*SCM_ql_1 + SCM_sigma2w.*SCM_ql_2;
SCM_liquid_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*(SCM_ql_2 - SCM_ql_mean);

% Tidy cases with cloud base at lid
nocloud = clbas > 4000;
clbas = clbas.*(1 - nocloud);

% LES variances include the weightings by sigma_1 and sigma_2, so
% the total var (as diagnosed from the LES) is given by, eg:
% var(w) = ww_1 + ww_2 + ww_sg1 + ww_sg2
% Convert LES variances to per unit mass for comparison
% with SCM output
ww_1 = ww_1./sigma1;
ww_2 = ww_2./sigma2;
ww_sg1 = ww_sg1./sigma1;
ww_sg2 = ww_sg2./sigma2;
thth_1 = thth_1./sigma1;
thth_2 = thth_2./sigma2;
thth_sg1 = thth_sg1./sigma1;
thth_sg2 = thth_sg2./sigma2;
qvqv_1 = qvqv_1./sigma1;
qvqv_2 = qvqv_2./sigma2;
qvqv_sg1 = qvqv_sg1./sigma1;
qvqv_sg2 = qvqv_sg2./sigma2;