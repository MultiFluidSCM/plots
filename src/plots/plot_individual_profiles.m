% Mean profiles
for kt = 1:length(settings.times_to_plot)
    
    % Time
    t = settings.times_to_plot(kt);
    
    % Find the nearest profiles (in time) for the LES and SCM data
    [LES.t, LES.i] = min(abs(LES.times - t));
    [SCM.t, SCM.i] = min(abs(SCM.times - t));
    
    % SCM time in hours
    t_hours = SCM.times(SCM.i)/3600;
    
    timeseries_indices(kt) = SCM.i;
    
    % Get cloud base and boundary layer height from SCM
    [LES.t_cloud, LES.i_cloud] = min(abs(LES.t_cloud_fraction - t));
    [SCM.t_cloud, SCM.i_cloud] = min(abs(SCM.time_ser         - t));
    LES.z_cloud_base = LES.cloud_base(LES.i_cloud);
    SCM.z_cloud_base = SCM.zcbase(SCM.i_cloud);
    SCM.z_bl_top     = SCM.zstar(SCM.i_cloud);
    
    plot_individual_means
    
    plot_individual_fluxes
    
    plot_individual_variances
end