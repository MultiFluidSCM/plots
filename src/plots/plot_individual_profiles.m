% Mean profiles
for kt = 1:length(time_s)
    
    % Time
    t = time_s(kt);
    % In hours
    t_hours = t/3600;
    
    % Get nearest time in LES timeseries data
    [time_ser_value, time_ser_index] = min(abs(time_ser-t));
    % Get cloud base and boundary layer height from SCM
    LES_z_cloud_base = clbas(time_ser_index);
    
    % Get nearest time in SCM timeseries data
    [SCM_time_ser_value, SCM_time_ser_index] = min(abs(SCM_time_ser-t));
    % Get cloud base and boundary layer height from SCM
    SCM_z_cloud_base = SCM_zcbase(SCM_time_ser_index);
    SCM_z_bl_top = SCM_zstar(SCM_time_ser_index);

    % Updraft fraction
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(sigma2(:,kt),z,'r',SCM_sigma2(:,kt),SCM_zp,'r--')
    hold off
    xlim([0,0.5])
    ylim([0,settings.zplottop])
    xlabel('sigma 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["updraftFraction_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Vertical velocity (m/s)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(w_1(:,kt),z,'b',SCM_w_1(:,kt),SCM_zw,'b--',...
         w_2(:,kt),z,'r',SCM_w_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([-0.5,2.5])
    ylim([0,settings.zplottop])
    xlabel('w 1 and 2 (m/s)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["verticalVelocity_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Potential temperature (K)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(th_1(:,kt),z,'b',SCM_th_1(:,kt),SCM_zw,'b--',...
         th_2(:,kt),z,'r',SCM_th_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([300,320])
    ylim([0,settings.zplottop])
    xlabel('Theta 1 and 2 (K)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["potentialTemperature_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Updraft buoyancy(m/s^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(buoy(:,kt),z,'k',SCM_buoy(:,kt),SCM_zw,'k--',SCM_est_buoy(:,kt),SCM_zw,'k:')
    hold off
    xlim([-0.2,0.05])
    ylim([0,settings.zplottop])
    xlabel('Buoyancy (m/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs);
    filename = join(["updraftBuoyancy_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    
    % Total water mixing ratio (g/g)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(SCM_q_1(:,kt),SCM_zw,'b--',SCM_q_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,0.02])
    ylim([0,settings.zplottop])
    xlabel('q_T 1 & 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["mixingRatioT_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Water vapour mixing ratio (g/g)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(qv_1(:,kt),z,'b',SCM_qv_1(:,kt),SCM_zw,'b--',...
         qv_2(:,kt),z,'r',SCM_qv_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,0.02])
    ylim([0,settings.zplottop])
    xlabel('q_v 1 & 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["mixingRatioV_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Liquid water mixing ratio (g/g)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(1e3*ql_1(:,kt),z,'b',1e3*SCM_ql_1(:,kt),SCM_zw,'b--',...
         1e3*ql_2(:,kt),z,'r',1e3*SCM_ql_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,1.2])
    ylim([0,settings.zplottop])
    xlabel('q_l 1 and 2 (g/kg)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["mixingRatioL_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved buoyancy flux (m^2/s^3)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(buoy_flux_res(:,kt),z,'k',SCM_buoy_flux_res(:,kt),SCM_zw,'k--')
    hold off
    xlim([-2e-3,2e-3])
    ylim([0,settings.zplottop])
    xlabel('res wb (m^2/s^3)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedBuoyancyFlux_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved moisture flux
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(moisture_flux_res(:,kt),z,'k',SCM_moisture_flux_res(:,kt),SCM_zw,'k--')
    hold off
    xlim([0,3e-4])
    ylim([0,settings.zplottop])
    xlabel('res wq_t (m/s)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedMoistureFlux_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved vapour flux
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(vapour_flux_res(:,kt),z,'k',SCM_vapour_flux_res(:,kt),SCM_zw,'k--')
    hold off
    xlim([0,3e-4])
    ylim([0,settings.zplottop])
    xlabel('res wq_v (m/s)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedVapourFlux_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Resolved liquid flux
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(liquid_flux_res(:,kt),z,'k',SCM_liquid_flux_res(:,kt),SCM_zw,'k--')
    hold off
    xlim([0,5e-5])
    ylim([0,settings.zplottop])
    xlabel('res wq_l (m/s)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedLiquidFlux_",num2str(kt)], "");
    save_figure(settings, fig, filename);





    % Resolved buoyancy fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wb_res1(:,kt),z,'b',wb_res1(:,kt),z,'b--',...
         wb_res2(:,kt),z,'r',wb_res2(:,kt),z,'r--')
    hold off
    xlim([-2e-3,2e-3])
    ylim([0,settings.zplottop])
    xlabel('b flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedBuoyancyFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Subgrid buoyancy fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wb_sg1(:,kt),z,'b',wb_sg1(:,kt),z,'b--',...
         wb_sg2(:,kt),z,'r',wb_sg2(:,kt),z,'r--')
    hold off
    xlim([-2e-3,2e-3])
    ylim([0,settings.zplottop])
    xlabel('b flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridBuoyancyFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved moisture fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wqv_res1(:,kt),z,'b',1e6*SCM_wq_res1(:,kt),SCM_zw,'b--',...
         wqv_res2(:,kt),z,'r',1e6*SCM_wq_res1(:,kt),SCM_zw,'r--')
    hold off
    xlim([-1e2,5e2])
    ylim([0,settings.zplottop])
    xlabel('qv flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedMoistureFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Subgrid moisture fluxes
    fig = figure(1);
    clf('reset')
    q1 = SCM_q_1(:,kt);
    ddz_q1(1) = 0;
    ddz_q1(2:length(SCM_zw)) = (q1(2:length(SCM_zw)) - q1(1:length(SCM_zw)-1));
    %ddz_q1(length(SCM_zw)) = 0;
    q2 = SCM_q_2(:,kt);
    ddz_q2(1) = 0;
    ddz_q2(2:length(SCM_zw)) = (q2(2:length(SCM_zw)) - q2(1:length(SCM_zw)-1));
    %ddz_q1(length(SCM_zw)) = 0;
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wqv_sg1(:,kt),z,'b',1e8*SCM_wq_sg1(:,kt),SCM_zw,'b--',...
         wqv_sg2(:,kt),z,'r',1e8*SCM_wq_sg2(:,kt),SCM_zw,'r--')
%     plot(wqv_sg1(:,kt),z,'b',1e3*ddz_q1(:,kt),SCM_zw,'b--',...
%          wqv_sg2(:,kt),z,'r',1e3*ddz_q2(:,kt),SCM_zw,'r--')
    hold off
    xlim([-1e2,5e2])
    ylim([0,settings.zplottop])
    xlabel('qv flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridMoistureFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Resolved pot. temperature fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wth_res1(:,kt),z,'b',wth_res1(:,kt),z,'b--',...
         wth_res2(:,kt),z,'r',wth_res2(:,kt),z,'r--')
    hold off
    xlim([-50,50])
    ylim([0,settings.zplottop])
    xlabel('theta flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedTemperatureFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Subgrid pot. temperature fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wth_sg1(:,kt),z,'b',wth_sg1(:,kt),z,'b--',...
         wth_sg2(:,kt),z,'r',wth_sg2(:,kt),z,'r--')
    hold off
    xlim([-50,50])
    ylim([0,settings.zplottop])
    xlabel('theta flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridTemperatureFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved moist pot. temperature fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wthv_res1(:,kt),z,'b',wthv_res1(:,kt),z,'b--',...
         wthv_res2(:,kt),z,'r',wthv_res2(:,kt),z,'r--')
    hold off
    xlim([-70,70])
    ylim([0,settings.zplottop])
    xlabel('thetav flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedTemperatureMoistFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Subgrid moist pot. temperature fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(wthv_sg1(:,kt),z,'b',wthv_sg1(:,kt),z,'b--',...
         wthv_sg2(:,kt),z,'r',wthv_sg2(:,kt),z,'r--')
    hold off
    xlim([-70,70])
    ylim([0,settings.zplottop])
    xlabel('thetav flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridTemperatureMoistFluxes_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Additional forcing term for entropy
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(SCM_EXTRA_FORCING_1(:,kt),SCM_zw,'b--',...
         SCM_EXTRA_FORCING_2(:,kt),SCM_zw,'r--')
    hold off
    xlim([-0.1,0.05])
    ylim([0,settings.zplottop])
    xlabel('additional forcing','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["additionalForcing_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    
    
    
    % Resolved TKE (m^2/s^2) (these are not weighted by sigma's)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(e1_res(:,kt),z,'b',SCM_e1_res(:,kt),SCM_zp,'b--',...
         e2_res(:,kt),z,'r',SCM_e2_res(:,kt),SCM_zp,'r--')
    hold off
    xlim([0,5])
    ylim([0,settings.zplottop])
    xlabel('Res tke (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedTKE_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % SG TKE (m^2/s^2) (these are not weighted by sigma's)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(e1_sg(:,kt),z,'b',SCM_e1_sg(:,kt),SCM_zp,'b--',...
         e2_sg(:,kt),z,'r',SCM_e2_sg(:,kt),SCM_zp,'r--')
%     0.5*ww_sg2(:,kt),z,'k')
    hold off
    xlim([0,5])
    ylim([0,settings.zplottop])
    xlabel('SG tke (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridTKE_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved Vertical velocity variance (m^2/s^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(ww_1(:,kt),z,'b',SCM_ww1(:,kt),SCM_zw,'b--',...
         ww_2(:,kt),z,'r',SCM_ww2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,5])
    ylim([0,settings.zplottop])
    xlabel('Res w var (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedWVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % SG vertical velocity variance (m^2/s^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(ww_sg1(:,kt),z,'b',SCM_ww_sg1(:,kt),SCM_zp,'b--',...
         ww_sg2(:,kt),z,'r',SCM_ww_sg2(:,kt),SCM_zp,'r--')
    hold off
    xlim([0,5])
    ylim([0,settings.zplottop])
    xlabel('SG w var (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridWVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % Resolved potential temperature variance (K^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(thth_1(:,kt),z,'b',SCM_thth1(:,kt),SCM_zw,'b--',...
         thth_2(:,kt),z,'r',SCM_thth2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,10])
    ylim([0,settings.zplottop])
    xlabel('Res theta var (K^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedThetaVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % SG potential temperature variance (K^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(thth_sg1(:,kt),z,'b',SCM_thth_sg1(:,kt),SCM_zw,'b--',...
         thth_sg2(:,kt),z,'r',SCM_thth_sg2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,3])
    ylim([0,settings.zplottop])
    xlabel('SG theta var (K^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridThetaVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);

    % Resolved water mixing ratio variance (kg^2/kg^2)
    % *** This is water vapour for LES, total water for SCM
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(1e6*qvqv_1(:,kt),z,'b',1e6*SCM_qq1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_2(:,kt),z,'r',1e6*SCM_qq2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,40])
    ylim([0,settings.zplottop])
    xlabel('Res q or q_v var (g^2/kg^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["resolvedMixingRatioVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);
    
    % SG water mixing ratio variance (kg^2/kg^2)
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    hold on
    plot(1e6*qvqv_sg1(:,kt),z,'b',1e6*SCM_qq_sg1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_sg2(:,kt),z,'r',1e6*SCM_qq_sg2(:,kt),SCM_zw,'r--')
    hold off
    xlim([0,20])
    ylim([0,settings.zplottop])
    xlabel('SG q or q_v var (g^2/kg^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["subgridMixingRatioVar_",num2str(kt)], "");
    save_figure(settings, fig, filename);
end