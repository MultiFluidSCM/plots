
% Time series
fig = figure(3);
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Time in hours for time series
time_ser_hours = time_ser/3600;
SCM_time_ser_hours = SCM_time_ser/3600;

% Total cloud cover
plot(time_ser_hours,totc,'r',SCM_time_ser_hours,SCM_cldcov,'r--')
xlabel('Time','fontsize',settings.fs)
ylabel('Tot cld cov','fontsize',settings.fs)
title('Tot cld cov','fontsize',settings.fs)
set(gca,'fontsize',settings.fs,'XTick',[1:14])
%pause

saveas(fig, fullfile(settings.folders.root,  join(["cloud_cover_",settings.folders.id,".png"], "")));
save_figure(settings, fig, "timeseries_cloud_cover");

fig = figure(4);
set(gcf,'Position',[440 432 765 366])
subplot(1,1,1)

% Cloud top and base
plot(time_ser_hours,cltop,'r',SCM_time_ser_hours,SCM_zctop ,'r--',...
     time_ser_hours,clbas,'k',SCM_time_ser_hours,SCM_zcbase,'k--',...
                              SCM_time_ser_hours,SCM_zstar,'b--')
xlabel('Time','fontsize',settings.fs)
ylabel('Cld base/top','fontsize',settings.fs)
title('Cloud base/top','fontsize',settings.fs)
set(gca,'fontsize',settings.fs,'XTick',[1:14])
%pause

saveas(fig, fullfile(settings.folders.root,  join(["cloud_height_",settings.folders.id,".png"], "")));
save_figure(settings, fig, "timeseries_cloud_height");

if exist('SCM_cloud_fraction')
    fig = figure(4);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)
    
    [X,Y] = meshgrid(SCM_time_ser_hours, SCM_zw);
    levels = [0.001,0.005,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1];
    
    contourf(X, Y, SCM_cloud_fraction, levels, 'w')
    colorbar
    
    hold on
    plot(time_ser_hours,cltop,'k', time_ser_hours,clbas,'k')
    hold off
    
    xlabel('Time','fontsize',settings.fs)
    ylabel('z (m)','fontsize',settings.fs)
    title('Cloud fraction','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    saveas(fig, fullfile(settings.folders.root,  join(["cloud_fraction_",settings.folders.id,".png"], "")));
    save_figure(settings, fig, "timeseries_cloud_fraction");
end


if exist('SCM_cbase_sigma2')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_sigma2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('\sigma_2','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_sigma2");
end

if exist('SCM_cbase_w')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_w,'k--',...
         SCM_time_ser_hours,SCM_cbase_w1,'b--',...
         SCM_time_ser_hours,SCM_cbase_w2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('w','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_w");
end

if exist('SCM_cbase_q')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_q,'k--',...
         SCM_time_ser_hours,SCM_cbase_q1,'b--',...
         SCM_time_ser_hours,SCM_cbase_q2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('q','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_q");
end

if exist('SCM_cbase_eta1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_eta1,'b--',...
         SCM_time_ser_hours,SCM_cbase_eta2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('\eta','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_eta");
end

if exist('SCM_cbase_tke1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_tke1,'b--',...
         SCM_time_ser_hours,SCM_cbase_tke2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel('TKE','fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_tke");
end

if exist('SCM_cbase_wq_res1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_wq_res1,'b--',...
         SCM_time_ser_hours,SCM_cbase_wq_res2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Resolved \overline{w'q'}",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_wq_res");
end

if exist('SCM_cbase_wq_sg1')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_wq_sg1,'b--',...
         SCM_time_ser_hours,SCM_cbase_wq_sg2,'r--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Subgrid \overline{w'q'}",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_wq_sg");
end

if exist('SCM_cbase_relabel_M12')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_relabel_M12,'k--',...
         SCM_time_ser_hours,SCM_cbase_relabel_M12_sort,'c--',...
         SCM_time_ser_hours,SCM_cbase_relabel_M12_mix,'m--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Detrainment",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_M12");
end

if exist('SCM_cbase_relabel_M21')
    fig = figure(1);
    set(gcf,'Position',[440 432 765 366])
    subplot(1,1,1)

    % Cloud top and base
    plot(SCM_time_ser_hours,SCM_cbase_relabel_M21,'k--',...
         SCM_time_ser_hours,SCM_cbase_relabel_M21_instab,'c--',...
         SCM_time_ser_hours,SCM_cbase_relabel_M21_mix,'m--')
    xlabel('Time','fontsize',settings.fs)
    ylabel("Entrainment",'fontsize',settings.fs)
    title('Cloud base value','fontsize',settings.fs)
    set(gca,'fontsize',settings.fs,'XTick',[1:14])
    
    save_figure(settings, fig, "timeseries_cbase_M21");
end