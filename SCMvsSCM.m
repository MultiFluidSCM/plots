% Simply read in ARM data and check it makes sense

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).



clear

% Number of cases to plot
ncase = 2;
% The cases themselves are chosen in script choose_case.m


% Gravitational acceleration
gravity = 9.806;


% Figure font size
fs = 18;

% Top of plots
zplottop = 4000;


% Position figures
figure(1)
set(gcf,'Position',[76 166 1257 624])
figure(2)
set(gcf,'Position',[76 166 1257 624])
figure(3)
set(gcf,'Position',[440 432 765 366])
figure(4)
set(gcf,'Position',[440 432 765 366])

% Mean profiles
figure(1)
for kt = 1:4

    for icase = 1:ncase
        
        choose_case
    
        % Read SCM results
        fname = ['SCM_',scheme];
        load(fname);

        % Estimate updraft buoyancy
        SCM_th_mean = SCM_sigma1w.*SCM_th_1 + SCM_sigma2w.*SCM_th_2;
        SCM_est_buoy = gravity*(SCM_th_2 - SCM_th_mean)./SCM_th_mean;

        % Estimate resolved buoyancy flux
        % buoy_flux_res = (w_2 - w_1).*sigma2.*buoy;
        SCM_buoy_flux_res = (SCM_w_2 - SCM_w_1).*SCM_sigma2w.*SCM_est_buoy;

        % Time
        t = SCM_times(kt);
        % In hours
        t_hours = t/3600;

        % Updraft fraction
        subplot(2,4,1)
        if icase == 1
            hold off
        end
        plot(SCM_sigma2(:,kt),SCM_zp,ls)
        ylim([0,zplottop])
        xlabel('sigma 2','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        % pause
    
        % Vertical velocity (m/s)
        subplot(2,4,2)
        if icase == 1
            hold off
        end
        plot(SCM_w_1(:,kt),SCM_zw,[ls,'--'],...
             SCM_w_2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('w 1 and 2 (m/s)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        % Potential temperature (K)
        subplot(2,4,3)
        if icase == 1
            hold off
        end
        plot(SCM_th_1(:,kt),SCM_zw,[ls,'--'],...
             SCM_th_2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('Theta 1 and 2 (K)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        % Updraft buoyancy(m/s^2)
        subplot(2,4,4)
        if icase == 1
            hold off
        end
        plot(SCM_buoy(:,kt),SCM_zw,ls,SCM_est_buoy(:,kt),SCM_zw,[ls,'--'])
        ylim([0,zplottop])
        xlabel('Buoyancy (m/s^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        
        % Total water mixing ratio (g/g)
        subplot(2,4,5)
        if icase == 1
            hold off
        end
        plot(SCM_q_1(:,kt),SCM_zw,[ls,'--'],SCM_q_2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('q_T 1 & 2','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        % Water vapour mixing ratio (g/g)
        subplot(2,4,6)
        if icase == 1
            hold off
        end
        plot(SCM_qv_1(:,kt),SCM_zw,[ls,'--'],...
             SCM_qv_2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('q_v 1 & 2','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        % Liquid water mixing ratio (g/g)
        subplot(2,4,7)
        if icase == 1
            hold off
        end
        plot(1e3*SCM_ql_1(:,kt),SCM_zw,[ls,'--'],...
             1e3*SCM_ql_2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('q_l 1 and 2 (g/kg)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause
        
        % Resolved buoyancy flux (m^2/s^3)
        subplot(2,4,8)
        if icase == 1
            hold off
        end
        plot(SCM_buoy_flux_res(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('res wb (m^2/s^3)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        pause
        
    end
    
end



% % Higher moments
figure(2)
for kt = 1:4

    for icase = 1:ncase
        
        choose_case
    
        % Read SCM results
        fname = ['SCM_',scheme];
        load(fname);

        % Time
        t = SCM_times(kt);
        % In hours
        t_hours = t/3600;

        % Resolved TKE (m^2/s^2) (these are not weighted by sigma's)
        subplot(2,4,1)
        if icase == 1
            hold off
        end
        plot(SCM_e1_res(:,kt),SCM_zp,[ls,'--'],...
             SCM_e2_res(:,kt),SCM_zp,ls)
        ylim([0,zplottop])
        xlabel('Res tke (m^2/s^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % SG TKE (m^2/s^2) (these are not weighted by sigma's)
        subplot(2,4,5)
        if icase == 1
            hold off
        end
        plot(SCM_e1_sg(:,kt),SCM_zp,[ls,'--'],...
             SCM_e2_sg(:,kt),SCM_zp,ls)
    %     0.5*ww_sg2(:,kt),z,'k')
        ylim([0,zplottop])
        xlabel('SG tke (m^2/s^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % Resolved Vertical velocity variance (m^2/s^2)
        subplot(2,4,2)
        if icase == 1
            hold off
        end
        plot(SCM_ww1(:,kt),SCM_zw,[ls,'--'],...
             SCM_ww2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('Res w var (m^2/s^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % SG vertical velocity variance (m^2/s^2)
        subplot(2,4,6)
        if icase == 1
            hold off
        end
        plot(SCM_ww_sg1(:,kt),SCM_zp,[ls,'--'],...
             SCM_ww_sg2(:,kt),SCM_zp,ls)
        ylim([0,zplottop])
        xlabel('SG w var (m^2/s^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % Resolved potential temperature variance (K^2)
        subplot(2,4,3)
        if icase == 1
            hold off
        end
        plot(SCM_thth1(:,kt),SCM_zw,[ls,'--'],...
             SCM_thth2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('Res theta var (K^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % SG potential temperature variance (K^2)
        subplot(2,4,7)
        if icase == 1
            hold off
        end
        plot(SCM_thth_sg1(:,kt),SCM_zw,[ls,'--'],...
             SCM_thth_sg2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('SG theta var (K^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % Resolved water mixing ratio variance (kg^2/kg^2)
        % *** This is water vapour for LES, total water for SCM
        subplot(2,4,4)
        if icase == 1
            hold off
        end
        plot(1e6*SCM_qq1(:,kt),SCM_zw,[ls,'--'],...
             1e6*SCM_qq2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('Res q or q_v var (g^2/kg^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        %pause

        % SG water mixing ratio variance (kg^2/kg^2)
        subplot(2,4,8)
        if icase == 1
            hold off
        end
        plot(1e6*SCM_qq_sg1(:,kt),SCM_zw,[ls,'--'],...
             1e6*SCM_qq_sg2(:,kt),SCM_zw,ls)
        ylim([0,zplottop])
        xlabel('SG q or q_v var (g^2/kg^2)','fontsize',fs)
        ylabel(' z(m) ','fontsize',fs)
        title([num2str(t_hours),' hours'],'fontsize',fs)
        set(gca,'fontsize',fs)
        hold on
        pause

    end
    
end



% Time series
figure(3)
set(gcf,'Position',[440 432 765 366])
figure(4)
set(gcf,'Position',[440 432 765 366])

for icase = 1:ncase

    choose_case

    % Read SCM results
    fname = ['SCM_',scheme];
    load(fname);

    % Time
    t = SCM_times(kt);
    % In hours
    t_hours = t/3600;


    % Time in hours for time series
    SCM_time_ser_hours = SCM_time_ser/3600;

    % Total cloud cover
    figure(3)
    subplot(1,1,1)
    if icase == 1
        hold off
    end
    plot(SCM_time_ser_hours,SCM_cldcov,ls)
    xlabel('Time','fontsize',fs)
    ylabel('Tot cld cov','fontsize',fs)
    title('Tot cld cov','fontsize',fs)
    set(gca,'fontsize',fs,'XTick',[1:14])
    hold on
    pause

    % Cloud top and base
    % Tidy cases with cloud base at lid
    figure(4)
    subplot(1,1,1)
    if icase == 1
        hold off
    end
    plot(SCM_time_ser_hours,SCM_zctop ,ls,...
         SCM_time_ser_hours,SCM_zcbase,[ls,'--'])
    xlabel('Time','fontsize',fs)
    ylabel('Cld base/top','fontsize',fs)
    title('Cloud base/top','fontsize',fs)
    set(gca,'fontsize',fs,'XTick',[1:14])
    hold on
    pause

end


