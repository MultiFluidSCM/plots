% Resolved buoyancy flux (m^2/s^3)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.wb_res2(:,LES.i),LES.z,'k',SCM.buoy_flux_res(:,SCM.i),SCM.zw,'k--')
hold off
xlim([-2e-3,2e-3])
ylim([0,settings.zplottop])
xlabel('res wb (m^2/s^3)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wb_2_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved moisture flux
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.moisture_flux_res(:,LES.i),LES.z,'k',SCM.moisture_flux_res(:,SCM.i),SCM.zw,'k--')
hold off
xlim([0,3e-4])
ylim([0,settings.zplottop])
xlabel('res wq_t (m/s)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wqt_2_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved vapour flux
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.vapour_flux_res(:,LES.i),LES.z,'k',SCM.vapour_flux_res(:,SCM.i),SCM.zw,'k--')
hold off
xlim([0,3e-4])
ylim([0,settings.zplottop])
xlabel('res wq_v (m/s)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wqv_2_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved liquid flux
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.liquid_flux_res(:,LES.i),LES.z,'k',SCM.liquid_flux_res(:,SCM.i),SCM.zw,'k--')
hold off
xlim([0,5e-5])
ylim([0,settings.zplottop])
xlabel('res wq_l (m/s)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wql_2_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved buoyancy fluxes
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.wb_res1(:,LES.i),LES.z,'b',LES.wb_res1(:,LES.i),LES.z,'b--',...
     LES.wb_res2(:,LES.i),LES.z,'r',LES.wb_res2(:,LES.i),LES.z,'r--')
hold off
xlim([-2e-3,2e-3])
ylim([0,settings.zplottop])
xlabel('b flux res','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wb_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Subgrid buoyancy fluxes
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.wb_sg1(:,LES.i),LES.z,'b',LES.wb_sg1(:,LES.i),LES.z,'b--',...
     LES.wb_sg2(:,LES.i),LES.z,'r',LES.wb_sg2(:,LES.i),LES.z,'r--')
hold off
xlim([-2e-3,2e-3])
ylim([0,settings.zplottop])
xlabel('b flux sg','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["wb_sg_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved moisture fluxes
if exist('wqv_res1') & exist('SCM.wq_res1')
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wqv_res1(:,LES.i),LES.z,'b',SCM.wq_res1(:,SCM.i),SCM.zw,'b--',...
         LES.wqv_res2(:,LES.i),LES.z,'r',SCM.wq_res2(:,SCM.i),SCM.zw,'r--')
    hold off
    xlim([-5e2,5e2])
    ylim([0,settings.zplottop])
    xlabel('qv flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wqv_res_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
end



% Subgrid moisture fluxes
if exist('wqv_sg1') & exist('SCM.wq_sg1')
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wqv_sg1(:,LES.i),LES.z,'b',SCM.wq_sg1(:,SCM.i),SCM.zw,'b--',...
         LES.wqv_sg2(:,LES.i),LES.z,'r',SCM.wq_sg2(:,SCM.i),SCM.zw,'r--')
    hold off
    xlim([-5e2,5e2])
    ylim([0,settings.zplottop])
    xlabel('qv flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wqv_sg_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
end



% Total moisture fluxes
if exist('wqv_res1') & exist('SCM.wq_res1') & exist('wqv_sg1') & exist('SCM.wq_sg1')
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wqv_res1(:,LES.i)+LES.wqv_res2(:,LES.i)+LES.wqv_sg1(:,LES.i)+LES.wqv_sg2(:,LES.i),LES.z,'k',...
         SCM.wq_res1(:,SCM.i)+SCM.wq_res2(:,SCM.i)+SCM.wq_sg1(:,SCM.i)+SCM.wq_sg2(:,SCM.i),SCM.zw,'k--')
    hold off
    xlim([-1e2,8e2])
    ylim([0,settings.zplottop])
    xlabel('qv flux total','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wq_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
end



% Resolved potential temperature fluxes
if exist('wth_res1') & exist('SCM.wth_res1')
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wth_res1(:,LES.i),LES.z,'b',SCM.wth_res1(:,SCM.i),SCM.zw,'b--',...
         LES.wth_res2(:,LES.i),LES.z,'r',SCM.wth_res2(:,SCM.i),SCM.zw,'r--')
    hold off
    xlim([-8e1,8e1])
    ylim([0,settings.zplottop])
    xlabel('\theta_v flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wth_res_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
    
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wthv_res1(:,LES.i),LES.z,'b',SCM.wth_res1(:,SCM.i),SCM.zw,'b--',...
         LES.wthv_res2(:,LES.i),LES.z,'r',SCM.wth_res2(:,SCM.i),SCM.zw,'r--')
    hold off
    xlim([-8e1,8e1])
    ylim([0,settings.zplottop])
    xlabel('\theta_v flux res','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wthv_res_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
end



% Subgrid potential temperature fluxes
if exist('wth_sg1') & exist('SCM.wth_sg1')
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wth_sg1(:,LES.i),LES.z,'b',SCM.wth_sg1(:,SCM.i),SCM.zw,'b--',...
         LES.wth_sg2(:,LES.i),LES.z,'r',SCM.wth_sg2(:,SCM.i),SCM.zw,'r--')
    hold off
    xlim([-8e1,8e1])
    ylim([0,settings.zplottop])
    xlabel('qth flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wth_sg_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
    
    % Subgrid moist pot. temperature fluxes
    fig = figure(1);
    clf('reset')
    subplot(1,1,1)
    indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
    hold on
    plot(LES.wthv_sg1(:,LES.i),LES.z,'b',LES.wthv_sg1(:,LES.i),LES.z,'b--',...
         LES.wthv_sg2(:,LES.i),LES.z,'r',LES.wthv_sg2(:,LES.i),LES.z,'r--')
    hold off
    xlim([-70,70])
    ylim([0,settings.zplottop])
    xlabel('thetav flux sg','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    set(gcf,'position',[10,10,500,500]);
    filename = join(["wthv_sg_",num2str(SCM.i)], "");
    save_figure(settings, fig, filename);
end

