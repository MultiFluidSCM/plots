summary = struct();

% -------------------------------------------------------- %
% START OF CLOUD STATISTICS
% -------------------------------------------------------- %
summary.mean_w_cloud_base = 0;
summary.mean_z_cloud_base = 0;
summary.mean_z_cloud_top  = 0;
summary.variation_cloud_base = 0;
summary.variation_cloud_top  = 0;
summary.total_t_cloud = 0;
summary.total_i_cloud = 0;

new.t = -1;
new.z_cloud_base = 0;
new.z_cloud_top  = 0;
new.z_bl_top     = 0;
for kt = 1:min(length(SCM.time_ser))
    old = new;
    
    % Time
    new.t = SCM.time_ser(kt);
    new.z_cloud_base = SCM.zcbase(kt);
    new.z_cloud_top  = SCM.zctop(kt);
    new.z_bl_top     = SCM.zstar(kt);
    
    if new.z_cloud_base > 100
        summary.total_i_cloud = summary.total_i_cloud + 1;
        
        summary.mean_z_cloud_base = summary.mean_z_cloud_base + new.z_cloud_base;
        summary.mean_z_cloud_top  = summary.mean_z_cloud_top  + new.z_cloud_top;
        
        if old.z_cloud_base > 100
            dt = new.t - old.t;
            summary.total_t_cloud = summary.total_t_cloud + dt;
            
            summary.mean_w_cloud_base = summary.mean_w_cloud_base ...
                                      + (new.z_cloud_base-old.z_cloud_base)/dt;
            
            summary.variation_cloud_base = summary.variation_cloud_base ...
                                         + abs(new.z_cloud_base - old.z_cloud_base);
            summary.variation_cloud_top  = summary.variation_cloud_top  ...
                                         + abs(new.z_cloud_top  - old.z_cloud_top);
        end
    end
end

summary.total_t_cloud = summary.total_t_cloud + 1e-8*(summary.total_t_cloud == 0);
summary.total_i_cloud = summary.total_i_cloud + 1e-8*(summary.total_i_cloud <= 1);
summary.mean_w_cloud_base = summary.mean_w_cloud_base./(summary.total_i_cloud-1);
summary.mean_z_cloud_base = summary.mean_z_cloud_base./summary.total_i_cloud;
summary.mean_z_cloud_top  = summary.mean_z_cloud_top ./summary.total_i_cloud;

disp(" ");
disp("CLOUD STATISTICS SUMMARY");
if summary.total_i_cloud >= 2
    disp(sprintf('Total cloud cover: %0.2f hrs (steps: %0.0f)', summary.total_t_cloud/3600, summary.total_i_cloud));
    disp(sprintf('Mean cloud base:   %0.2f km', summary.mean_z_cloud_base/1000));
    disp(sprintf('Mean cloud top:    %0.2f km', summary.mean_z_cloud_top /1000));
    disp(sprintf('Mean cloud base w: %0.4f m/s', summary.mean_w_cloud_base));
    disp(sprintf('Mean cloud base variation: %0.2f km', summary.variation_cloud_base/1000));
    disp(sprintf('Mean cloud top  variation: %0.2f km', summary.variation_cloud_top/1000));
else
    disp("Little-to-no cloud detected.");
end
% -------------------------------------------------------- %
% END OF CLOUD STATISTICS
% -------------------------------------------------------- %

