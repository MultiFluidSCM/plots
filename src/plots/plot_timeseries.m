
% Time in hours for time series
SCM.time_ser_hours = SCM.time_ser/3600;
LES.t_cloud_fraction_hours = double(LES.t_cloud_fraction)/3600;

% Time series
fig = figure(3);
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Total cloud cover
plot(SCM.time_ser_hours,SCM.cldcov,'k--',...
     LES.t_cloud_fraction_hours,LES.cloud_cover,'m',...
     LES.t_cloud_fraction_hours,LES.cloud_cover2,'r')
xlabel('t (hours)','fontsize',settings.fs)
ylabel('Tot cld cov','fontsize',settings.fs)
title('Tot cld cov','fontsize',settings.fs)
set(gca,'fontsize',settings.fs,'XTick',[1:14])

saveas(fig, fullfile(settings.folders.root,  join(["cloud_cover_",settings.folders.id,".png"], "")));
save_figure(settings, fig, "timeseries_cloud_cover");

fig = figure(4);
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Cloud top and base
plot(LES.t_cloud_fraction_hours,LES.cloud_top ,'r',SCM.time_ser_hours,SCM.zctop ,'r--',...
     LES.t_cloud_fraction_hours,LES.cloud_base,'k',SCM.time_ser_hours,SCM.zcbase,'k--',...
                                                   SCM.time_ser_hours,SCM.zstar,'b--')
xlabel('t (hours)','fontsize',settings.fs)
ylabel('Cld base/top','fontsize',settings.fs)
title('Cloud base/top','fontsize',settings.fs)
set(gca,'fontsize',settings.fs,'XTick',[1:14])

saveas(fig, fullfile(settings.folders.root,  join(["cloud_height_",settings.folders.id,".png"], "")));
save_figure(settings, fig, "timeseries_cloud_height");

if isfield(SCM, 'cloud_fraction')
    % Grid for contour plot
    [x_SCM, y_SCM] = meshgrid(SCM.time_ser_hours, SCM.zw);
    [x_LES, y_LES] = meshgrid(LES.t_cloud_fraction_hours, LES.z_cloud_fraction);
    
    % Contour levels
    levels = [0.001,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Contour for fluid 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fig = figure(4);
    set(gcf,'Position',[440 50 765 732])
    
    ax1 = subplot(2,1,1);
    contourf(x_LES, y_LES, LES.cloud_fraction1_sigma1, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top,'k', LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    ylabel('z (m)','fontsize',settings.fs)
    title('LES','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax1);
    cb.Label.String = 'Cloud fraction from fluid 1';
    caxis([levels(1), levels(end)]);
    
    
    ax2 = subplot(2,1,2);
    
    contourf(x_SCM, y_SCM, SCM.cloud_fraction1_sigma1, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top ,'k', ...
         LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    xlabel('t (hours)','fontsize',settings.fs)
    ylabel('z (m)','fontsize',settings.fs)
    title('SCM','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax2);
    cb.Label.String = 'Cloud fraction from fluid 1';
    caxis([levels(1), levels(end)]);
    
    saveas(fig, fullfile(settings.folders.root,  join(["cloud_fraction1_",settings.folders.id,".png"], "")));
    save_figure(settings, fig, "timeseries_cloud_fraction1");
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Contour for fluid 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fig = figure(4);
    set(gcf,'Position',[440 50 765 732])
    
    ax1 = subplot(2,1,1);
    contourf(x_LES, y_LES, LES.cloud_fraction2_sigma2, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top,'k', ...
         LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    ylabel('z (m)','fontsize',settings.fs)
    title('LES','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax1);
    cb.Label.String = 'Cloud fraction from fluid 2';
    caxis([levels(1), levels(end)]);
    
    
    ax2 = subplot(2,1,2);
    
    contourf(x_SCM, y_SCM, SCM.cloud_fraction2_sigma2, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top,'k', ...
         LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    xlabel('t (hours)','fontsize',settings.fs)
    ylabel('z (m)','fontsize',settings.fs)
    title('SCM','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax2);
    cb.Label.String = 'Cloud fraction from fluid 2';
    caxis([levels(1), levels(end)]);
    
    saveas(fig, fullfile(settings.folders.root,  join(["cloud_fraction2_",settings.folders.id,".png"], "")));
    save_figure(settings, fig, "timeseries_cloud_fraction2");
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Contour for total fluid
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fig = figure(4);
    set(gcf,'Position',[440 50 765 732])
    
    ax1 = subplot(2,1,1);
    contourf(x_LES, y_LES, LES.cloud_fraction, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top,'k', ...
         LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    ylabel('z (m)','fontsize',settings.fs)
    title('LES','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax1);
    cb.Label.String = 'Cloud fraction';
    caxis([levels(1), levels(end)]);
    
    
    ax2 = subplot(2,1,2);
    
    contourf(x_SCM, y_SCM, SCM.cloud_fraction, levels, 'w')
    
    hold on
    plot(LES.t_cloud_fraction_hours, LES.cloud_top,'k', ...
         LES.t_cloud_fraction_hours, LES.cloud_base, 'k')
    hold off
    
    xlim([min(LES.t_cloud_fraction_hours), max(LES.t_cloud_fraction_hours)])
    ylim([0,settings.zplottop])
    xlabel('t (hours)','fontsize',settings.fs)
    ylabel('z (m)','fontsize',settings.fs)
    title('SCM','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    cb = colorbar(ax2);
    cb.Label.String = 'Cloud fraction';
    caxis([levels(1), levels(end)]);
    
    saveas(fig, fullfile(settings.folders.root,  join(["cloud_fraction_",settings.folders.id,".png"], "")));
    save_figure(settings, fig, "timeseries_cloud_fraction");
end


if exist('SCM.cbase_sigma2')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_sigma2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('\sigma_2','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_sigma2");
end

if exist('SCM.cbase_w')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_w,'k--',...
         SCM.time_ser_hours,SCM.cbase_w1,'b--',...
         SCM.time_ser_hours,SCM.cbase_w2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('w','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_w");
end

if exist('SCM.cbase_q')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_q,'k--',...
         SCM.time_ser_hours,SCM.cbase_q1,'b--',...
         SCM.time_ser_hours,SCM.cbase_q2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('q','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_q");
end

if exist('SCM.cbase_eta1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_eta1,'b--',...
         SCM.time_ser_hours,SCM.cbase_eta2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('\eta','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_eta");
end

if exist('SCM.cbase_tke1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_tke1,'b--',...
         SCM.time_ser_hours,SCM.cbase_tke2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('TKE','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_tke");
end

if exist('SCM.cbase_wq_res1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_wq_res1,'b--',...
         SCM.time_ser_hours,SCM.cbase_wq_res2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Resolved \overline{w'q'}",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_wq_res");
end

if exist('SCM.cbase_wq_sg1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_wq_sg1,'b--',...
         SCM.time_ser_hours,SCM.cbase_wq_sg2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Subgrid \overline{w'q'}",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_wq_sg");
end

if exist('SCM.cbase_relabel_M12')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_relabel_M12,'k--',...
         SCM.time_ser_hours,SCM.cbase_relabel_M12_sort,'c--',...
         SCM.time_ser_hours,SCM.cbase_relabel_M12_mix,'m--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Detrainment",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_M12");
end

if exist('SCM.cbase_relabel_M21')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM.time_ser_hours,SCM.cbase_relabel_M21,'k--',...
         SCM.time_ser_hours,SCM.cbase_relabel_M21_instab,'c--',...
         SCM.time_ser_hours,SCM.cbase_relabel_M21_mix,'m--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Entrainment",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_M21");
end