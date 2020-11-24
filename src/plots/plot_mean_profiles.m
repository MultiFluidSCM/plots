% Mean profiles
fig = figure(1);
set(gcf,'Position',[76 166 1257 624])
for kt = 1:4
    
    % Time
    t = time_s(kt);
    % In hours
    t_hours = t/3600;

    % Updraft fraction
    subplot(2,4,1)
    plot(sigma2(:,kt),z,'r',SCM_sigma2(:,kt),SCM_zp,'r--')
    ylim([0,settings.zplottop])
    xlabel('sigma 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    % pause
    
    % Vertical velocity (m/s)
    subplot(2,4,2)
    plot(w_1(:,kt),z,'b',SCM_w_1(:,kt),SCM_zw,'b--',...
         w_2(:,kt),z,'r',SCM_w_2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('w 1 and 2 (m/s)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % Potential temperature (K)
    subplot(2,4,3)
    plot(th_1(:,kt),z,'b',SCM_th_1(:,kt),SCM_zw,'b--',...
         th_2(:,kt),z,'r',SCM_th_2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('Theta 1 and 2 (K)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % Updraft buoyancy(m/s^2)
    subplot(2,4,4)
    plot(buoy(:,kt),z,'k',SCM_buoy(:,kt),SCM_zw,'k--',SCM_est_buoy(:,kt),SCM_zw,'k:')
    ylim([0,settings.zplottop])
    xlabel('Buoyancy (m/s^2)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    
    % Total water mixing ratio (g/g)
    subplot(2,4,5)
    plot(SCM_q_1(:,kt),SCM_zw,'b--',SCM_q_2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('q_T 1 & 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % Water vapour mixing ratio (g/g)
    subplot(2,4,6)
    plot(qv_1(:,kt),z,'b',SCM_qv_1(:,kt),SCM_zw,'b--',...
         qv_2(:,kt),z,'r',SCM_qv_2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('q_v 1 & 2','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause

    % Liquid water mixing ratio (g/g)
    subplot(2,4,7)
    plot(1e3*ql_1(:,kt),z,'b',1e3*SCM_ql_1(:,kt),SCM_zw,'b--',...
         1e3*ql_2(:,kt),z,'r',1e3*SCM_ql_2(:,kt),SCM_zw,'r--')
    ylim([0,settings.zplottop])
    xlabel('q_l 1 and 2 (g/kg)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    %pause
    
    % Resolved buoyancy flux (m^2/s^3)
    subplot(2,4,8)
    plot(buoy_flux_res(:,kt),z,'k',SCM_buoy_flux_res(:,kt),SCM_zw,'k--')
    ylim([0,settings.zplottop])
    xlabel('res wb (m^2/s^3)','fontsize',settings.fs)
    ylabel(' z(m) ','fontsize',settings.fs)
    title([num2str(t_hours),' hours'],'fontsize',settings.fs)
    set(gca,'fontsize',settings.fs)
    pause
    
    %set(gcf, 'WindowState', 'maximized');
    set(gcf,'position',[10,10,1800,900]);
    
    %filename = join(["profiles_meanLES_",num2str(kt),".png"], "");
    %saveas(fig, fullfile(folders.images, filename));
end