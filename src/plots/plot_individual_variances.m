% Resolved TKE (m^2/s^2) (these are not weighted by sigma's)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.e_res1(:,LES.i),LES.z,'b',SCM.e1_res(:,SCM.i),SCM.zp,'b--',...
     LES.e_res2(:,LES.i),LES.z,'r',SCM.e2_res(:,SCM.i),SCM.zp,'r--')
hold off
xlim([0,5])
ylim([0,settings.zplottop])
xlabel('Res tke (m^2/s^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["tke_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% SG TKE (m^2/s^2) (these are not weighted by sigma's)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.e_sg1(:,LES.i),LES.z,'b',SCM.e1_sg(:,SCM.i),SCM.zp,'b--',...
     LES.e_sg2(:,LES.i),LES.z,'r',SCM.e2_sg(:,SCM.i),SCM.zp,'r--')
hold off
xlim([0,5])
ylim([0,settings.zplottop])
xlabel('SG tke (m^2/s^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["tke_sg_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved Vertical velocity variance (m^2/s^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.ww_res1(:,LES.i),LES.z,'b',SCM.ww1(:,SCM.i),SCM.zw,'b--',...
     LES.ww_res2(:,LES.i),LES.z,'r',SCM.ww2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,5])
ylim([0,settings.zplottop])
xlabel('Res w var (m^2/s^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["ww_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% SG vertical velocity variance (m^2/s^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.ww_sg1(:,LES.i),LES.z,'b',SCM.ww_sg1(:,SCM.i),SCM.zp,'b--',...
     LES.ww_sg2(:,LES.i),LES.z,'r',SCM.ww_sg2(:,SCM.i),SCM.zp,'r--')
hold off
xlim([0,5])
ylim([0,settings.zplottop])
xlabel('SG w var (m^2/s^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["ww_sg_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved potential temperature variance (K^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.thth_res1(:,LES.i),LES.z,'b',SCM.thth1(:,SCM.i),SCM.zw,'b--',...
     LES.thth_res2(:,LES.i),LES.z,'r',SCM.thth2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,10])
ylim([0,settings.zplottop])
xlabel('Res theta var (K^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["thth_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% SG potential temperature variance (K^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(LES.thth_sg1(:,LES.i),LES.z,'b',SCM.thth_sg1(:,SCM.i),SCM.zw,'b--',...
     LES.thth_sg2(:,LES.i),LES.z,'r',SCM.thth_sg2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,3])
ylim([0,settings.zplottop])
xlabel('SG theta var (K^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["thth_sg_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% Resolved water mixing ratio variance (kg^2/kg^2)
% *** This is water vapour for LES, total water for SCM
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(1e6*LES.qvqv_res1(:,LES.i),LES.z,'b',1e6*SCM.qq1(:,SCM.i),SCM.zw,'b--',...
     1e6*LES.qvqv_res2(:,LES.i),LES.z,'r',1e6*SCM.qq2(:,SCM.i),SCM.zw,'r--')
hold off
xlim([0,40])
ylim([0,settings.zplottop])
xlabel('Res q or q_v var (g^2/kg^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["qvqv_res_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);



% SG water mixing ratio variance (kg^2/kg^2)
fig = figure(1);
clf('reset')
subplot(1,1,1)
indicate_cloud_base(settings, LES.z_cloud_base, SCM.z_cloud_base, SCM.z_bl_top)
hold on
plot(1e6*LES.qvqv_sg1(:,LES.i),LES.z,'b',1e6*SCM.qq_sg1(:,SCM.i),SCM.zp,'b--',...
     1e6*LES.qvqv_sg2(:,LES.i),LES.z,'r',1e6*SCM.qq_sg2(:,SCM.i),SCM.zp,'r--')
hold off
xlim([0,20])
ylim([0,settings.zplottop])
xlabel('SG q or q_v var (g^2/kg^2)','fontsize',settings.fs)
ylabel(' z(m) ','fontsize',settings.fs)
title([num2str(t_hours),' hours'],'fontsize',settings.fs)
set(gca,'fontsize',settings.fs)
set(gcf,'position',[10,10,500,500]);
filename = join(["qvqv_sg_",num2str(SCM.i)], "");
save_figure(settings, fig, filename);