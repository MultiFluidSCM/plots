% Updraft fraction
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.sigma_2(:,LES.i),LES.z,'r',SCM.sigma2(:,SCM.i),SCM.zp,'r--')
hold off
xlim([0,1])
ylim([0,settings.zplottop])
xlabel('sigma 2','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["sigma_2_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Vertical velocity (m/s)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.w_1(:,LES.i),LES.z,'b',SCM.w_1(:,SCM.i),SCM.zw,'b--',...
     LES.w_2(:,LES.i),LES.z,'r',SCM.w_2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([-0.5,2.5])
% xlim([-0.5,0.5])
ylim([0,settings.zplottop])
xlabel('w 1 and 2 (m/s)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["w_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Potential temperature (K)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.th_1(:,LES.i),LES.z,'b',SCM.th_1(:,SCM.i),SCM.zw,'b--',...
     LES.th_2(:,LES.i),LES.z,'r',SCM.th_2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([300,320])
% xlim([295,310])
ylim([0,settings.zplottop])
xlabel('\theta (K)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["th_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Virtual potential temperature (K)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.thv_1(:,LES.i),LES.z,'b',SCM.thv_1(:,SCM.i),SCM.zw,'b--',...
     LES.thv_2(:,LES.i),LES.z,'r',SCM.thv_2(:,SCM.i),SCM.zw,'r--')
hold off
% xlim([300,320])
xlim([295,310])
ylim([0,settings.zplottop])
xlabel('\theta_v (K)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["thv_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Updraft buoyancy(m/s^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(SCM.buoy(:,SCM.i),SCM.zw,'k--',...
     LES.b_2(:,LES.i),LES.z,'m', SCM.b_2_est(:,SCM.i),SCM.zw,'m--')
hold off
xlim([-0.1,0.05])
% xlim([-0.002,0.002])
ylim([0,settings.zplottop])
xlabel('Buoyancy (m/s^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs);
filename = join(["b_2_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Total water mixing ratio (g/g)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.q_1(:,LES.i),LES.z,'b',SCM.q_1(:,SCM.i),SCM.zw,'b--',...
     LES.q_2(:,LES.i),LES.z,'r',SCM.q_2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,0.02])
ylim([0,settings.zplottop])
xlabel('q_T 1 & 2','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["qt_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Water vapour mixing ratio (g/g)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.qv_1(:,LES.i),LES.z,'b',SCM.qv_1(:,SCM.i),SCM.zw,'b--',...
     LES.qv_2(:,LES.i),LES.z,'r',SCM.qv_2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,0.02])
ylim([0,settings.zplottop])
xlabel('q_v 1 & 2','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["qv_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Liquid water mixing ratio (g/g)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(1e3*LES.ql_1(:,LES.i),LES.z,'b',1e3*SCM.ql_1(:,SCM.i),SCM.zw,'b--',...
     1e3*LES.ql_2(:,LES.i),LES.z,'r',1e3*SCM.ql_2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,1.2])
ylim([0,settings.zplottop])
xlabel('q_l 1 and 2 (g/kg)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["ql_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);
    