% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).


clear


% Gravitational acceleration
gravity = 9.806;


% Figure font size
fs = 18;

% Top of plots
zplottop = 4000;


% Read LES results:

% First file
load('diagnostics_prof');
% Appendix to first file
load('prof_ql');
% Second file
load('diagnostics_tke');
% Third file
load('diagnostics_time_series');

% Read SCM results
%load('SCM_scheme0');     % Basic relaxation detrainment
%load('SCM_scheme0ug1'); % ug = 1 m/s
%load('SCM_scheme1');     % Sorting determines Mij but not etahat, qhat
%load('SCM_scheme3');     % Sorting determines Mij and etahat, qhat
%load('SCM_scheme4'); 
%load('SCM_scheme5');     % Unreproducible result ???
%load('SCM_scheme6x');     % Improved relabelling for variances, incomplete linearization
%load('SCM_scheme6y');     % Improved relabelling for variances, better but still incomplete linearization
%load('SCM_scheme7');     % Replace -dw2/dt by rate of mixing detrainment
%load('SCM_scheme8');     % Improved relabelling for TKE (incomplete linearization)
%load('SCM_scheme9dt5');  % Like scheme8 but only allow sorting where b<0. dt = 5 sec
%load('SCM_scheme10');     % Like scheme9 but with a 'smooth switch' based on b/sigma_b
%load('SCM_scheme10b');    % Like scheme10 but with half the sorting rate
%load('SCM_scheme10e');    % Like scheme10b but different switch normalized on tke/L
%load('SCM_scheme10edt5');   % 10e with dt = 5 sec
%load('SCM_results');

% Vertical profiles (219 levels)
% at heights zi (m)
% for 4 times given by time_s (seconds from the start of the simulation)

% Assume data are at the heights z = zi - dz/2 **CHECK**
dz = zi(2) - zi(1);
z = zi - 0.5*dz;

% Non-updraft fraction
sigma1 = 1 - sigma2;
% and liquid water
ql_1 = (ql_tot - sigma2.*ql_2)./sigma1;

% Estimate updraft buoyancy
th_mean = sigma1.*th_1 + sigma2.*th_2;
buoy = gravity*(th_2 - th_mean)./th_mean;
SCM_th_mean = SCM_sigma1w.*SCM_th_1 + SCM_sigma2w.*SCM_th_2;
SCM_est_buoy = gravity*(SCM_th_2 - SCM_th_mean)./SCM_th_mean;

% Estimate resolved buoyancy flux
buoy_flux_res = (w_2 - w_1).*sigma2.*buoy;
SCM_buoy_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_est_buoy;

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


% Mean profiles
figure(1)
set(gcf,'Position',[76 166 1257 624])
for kt = 1:4
    
    % Time
    t = time_s(kt);
    % In hours
    t_hours = t/3600;

    % Updraft fraction
    subplot(2,4,1)
    plot(sigma2(:,kt),z,'r',SCM_sigma2(:,kt),SCM_zp,'r--')
    ylim([0,zplottop])
    xlabel('sigma 2','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    % pause
    
    % Vertical velocity (m/s)
    subplot(2,4,2)
    plot(w_1(:,kt),z,'b',SCM_w_1(:,kt),SCM_zw,'b--',...
         w_2(:,kt),z,'r',SCM_w_2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('w 1 and 2 (m/s)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % Potential temperature (K)
    subplot(2,4,3)
    plot(th_1(:,kt),z,'b',SCM_th_1(:,kt),SCM_zw,'b--',...
         th_2(:,kt),z,'r',SCM_th_2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('Theta 1 and 2 (K)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % Updraft buoyancy(m/s^2)
    subplot(2,4,4)
    plot(buoy(:,kt),z,'k',SCM_buoy(:,kt),SCM_zw,'k--',SCM_est_buoy(:,kt),SCM_zw,'k:')
    ylim([0,zplottop])
    xlabel('Buoyancy (m/s^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    
    % Total water mixing ratio (g/g)
    subplot(2,4,5)
    plot(SCM_q_1(:,kt),SCM_zw,'b--',SCM_q_2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('q_T 1 & 2','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % Water vapour mixing ratio (g/g)
    subplot(2,4,6)
    plot(qv_1(:,kt),z,'b',SCM_qv_1(:,kt),SCM_zw,'b--',...
         qv_2(:,kt),z,'r',SCM_qv_2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('q_v 1 & 2','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % Liquid water mixing ratio (g/g)
    subplot(2,4,7)
    plot(1e3*ql_1(:,kt),z,'b',1e3*SCM_ql_1(:,kt),SCM_zw,'b--',...
         1e3*ql_2(:,kt),z,'r',1e3*SCM_ql_2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('q_l 1 and 2 (g/kg)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % Resolved buoyancy flux (m^2/s^3)
    subplot(2,4,8)
    plot(buoy_flux_res(:,kt),z,'k',SCM_buoy_flux_res(:,kt),SCM_zw,'k--')
    ylim([0,zplottop])
    xlabel('res wb (m^2/s^3)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    pause
    
end

% Higher moments
figure(2)
set(gcf,'Position',[76 166 1257 624])
for kt = 1:4
    
    % Time
    t = time_s(kt);
    % In hours
    t_hours = t/3600;
    
    % Resolved TKE (m^2/s^2) (these are not weighted by sigma's)
    subplot(2,4,1)
    plot(e1_res(:,kt),z,'b',SCM_e1_res(:,kt),SCM_zp,'b--',...
         e2_res(:,kt),z,'r',SCM_e2_res(:,kt),SCM_zp,'r--')
    ylim([0,zplottop])
    xlabel('Res tke (m^2/s^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % SG TKE (m^2/s^2) (these are not weighted by sigma's)
    subplot(2,4,5)
    plot(e1_sg(:,kt),z,'b',SCM_e1_sg(:,kt),SCM_zp,'b--',...
         e2_sg(:,kt),z,'r',SCM_e2_sg(:,kt),SCM_zp,'r--')
%     0.5*ww_sg2(:,kt),z,'k')
    ylim([0,zplottop])
    xlabel('SG tke (m^2/s^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % Resolved Vertical velocity variance (m^2/s^2)
    subplot(2,4,2)
    plot(ww_1(:,kt),z,'b',SCM_ww1(:,kt),SCM_zw,'b--',...
         ww_2(:,kt),z,'r',SCM_ww2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('Res w var (m^2/s^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % SG vertical velocity variance (m^2/s^2)
    subplot(2,4,6)
    plot(ww_sg1(:,kt),z,'b',SCM_ww_sg1(:,kt),SCM_zp,'b--',...
         ww_sg2(:,kt),z,'r',SCM_ww_sg2(:,kt),SCM_zp,'r--')
    ylim([0,zplottop])
    xlabel('SG w var (m^2/s^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % Resolved potential temperature variance (K^2)
    subplot(2,4,3)
    plot(thth_1(:,kt),z,'b',SCM_thth1(:,kt),SCM_zw,'b--',...
         thth_2(:,kt),z,'r',SCM_thth2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('Res theta var (K^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % SG potential temperature variance (K^2)
    subplot(2,4,7)
    plot(thth_sg1(:,kt),z,'b',SCM_thth_sg1(:,kt),SCM_zw,'b--',...
         thth_sg2(:,kt),z,'r',SCM_thth_sg2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('SG theta var (K^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause

    % Resolved water mixing ratio variance (kg^2/kg^2)
    % *** This is water vapour for LES, total water for SCM
    subplot(2,4,4)
    plot(1e6*qvqv_1(:,kt),z,'b',1e6*SCM_qq1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_2(:,kt),z,'r',1e6*SCM_qq2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('Res q or q_v var (g^2/kg^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    %pause
    
    % SG water mixing ratio variance (kg^2/kg^2)
    subplot(2,4,8)
    plot(1e6*qvqv_sg1(:,kt),z,'b',1e6*SCM_qq_sg1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_sg2(:,kt),z,'r',1e6*SCM_qq_sg2(:,kt),SCM_zw,'r--')
    ylim([0,zplottop])
    xlabel('SG q or q_v var (g^2/kg^2)','fontsize',fs)
    ylabel(' z(m) ','fontsize',fs)
    title([num2str(t_hours),' hours'],'fontsize',fs)
    set(gca,'fontsize',fs)
    pause
    
end

% Time series
figure(3)
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Time in hours for time series
time_ser_hours = time_ser/3600;
SCM_time_ser_hours = SCM_time_ser/3600;

% Total cloud cover
plot(time_ser_hours,totc,'r',SCM_time_ser_hours,SCM_cldcov,'r--')
xlabel('Time','fontsize',fs)
ylabel('Tot cld cov','fontsize',fs)
title('Tot cld cov','fontsize',fs)
set(gca,'fontsize',fs,'XTick',[1:14])
pause

figure(4)
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Cloud top and base
% Tidy cases with cloud base at lid
nocloud = clbas > 4000;
clbas = clbas.*(1 - nocloud);
plot(time_ser_hours,cltop,'r',SCM_time_ser_hours,SCM_zctop ,'r--',...
     time_ser_hours,clbas,'k',SCM_time_ser_hours,SCM_zcbase,'k--')
xlabel('Time','fontsize',fs)
ylabel('Cld base/top','fontsize',fs)
title('Cloud base/top','fontsize',fs)
set(gca,'fontsize',fs,'XTick',[1:14])
pause




