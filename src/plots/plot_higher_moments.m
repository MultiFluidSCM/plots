% Higher moments
fig = figure(2);
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
    ylim([0,settings.zplottop])
    xlabel('Res tke (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % SG TKE (m^2/s^2) (these are not weighted by sigma's)
    subplot(2,4,5)
    plot(e1_sg(:,kt),z,'b',SCM_e1_sg(:,kt),SCM_zp,'b--',...
         e2_sg(:,kt),z,'r',SCM_e2_sg(:,kt),SCM_zp,'r--')
%     0.5*ww_sg2(:,kt),z,'k')
    ylim([0,settings.zplottop])
    xlabel('SG tke (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % Resolved Vertical velocity variance (m^2/s^2)
    subplot(2,4,2)
    plot(ww_1(:,kt),z,'b',SCM_ww1(:,kt),SCM_zw,'b--',...
         ww_2(:,kt),z,'r',SCM_ww2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('Res w var (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % SG vertical velocity variance (m^2/s^2)
    subplot(2,4,6)
    plot(ww_sg1(:,kt),z,'b',SCM_ww_sg1(:,kt),SCM_zp,'b--',...
         ww_sg2(:,kt),z,'r',SCM_ww_sg2(:,kt),SCM_zp,'r--')
    ylim([0,settings.zplottop])
    xlabel('SG w var (m^2/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % Resolved potential temperature variance (K^2)
    subplot(2,4,3)
    plot(thth_1(:,kt),z,'b',SCM_thth1(:,kt),SCM_zw,'b--',...
         thth_2(:,kt),z,'r',SCM_thth2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('Res theta var (K^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % SG potential temperature variance (K^2)
    subplot(2,4,7)
    plot(thth_sg1(:,kt),z,'b',SCM_thth_sg1(:,kt),SCM_zw,'b--',...
         thth_sg2(:,kt),z,'r',SCM_thth_sg2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('SG theta var (K^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % Resolved water mixing ratio variance (kg^2/kg^2)
    % *** This is water vapour for LES, total water for SCM
    subplot(2,4,4)
    plot(1e6*qvqv_1(:,kt),z,'b',1e6*SCM_qq1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_2(:,kt),z,'r',1e6*SCM_qq2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('Res q or q_v var (g^2/kg^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % SG water mixing ratio variance (kg^2/kg^2)
    subplot(2,4,8)
    plot(1e6*qvqv_sg1(:,kt),z,'b',1e6*SCM_qq_sg1(:,kt),SCM_zw,'b--',...
         1e6*qvqv_sg2(:,kt),z,'r',1e6*SCM_qq_sg2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('SG q or q_v var (g^2/kg^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    pause
    
    %set(gcf, 'WindowState', 'maximized');
    set(gcf,'position',[10,10,1800,900]);
    
    %filename = join(["profiles_tke_",num2str(kt),".png"], "");
    %saveas(fig, fullfile(folders.images, filename));
end