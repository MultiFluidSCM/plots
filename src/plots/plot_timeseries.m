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

saveas(fig, fullfile(settings.folders.images, "timeseries_cloud_cover.png"));


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

saveas(fig, fullfile(settings.folders.images, "timeseries_cloud_height.png"));
