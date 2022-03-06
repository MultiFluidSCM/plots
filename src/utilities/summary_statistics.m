summary = struct();

summary.rmse = rmse_mean;
summary.rmse_sigma_2 = rmse_sigma_2;
summary.rmse_w_2     = rmse_w_2;
summary.rmse_ww_res2 = rmse_ww_res2;
summary.rmse_ww_sg2  = rmse_ww_sg2;
summary.rmse_e_2     = rmse_e_2;
summary.rmse_e_res2  = rmse_e_res2;
summary.rmse_e_sg2   = rmse_e_sg2;
summary.rmse_b_2     = rmse_b_2;
summary.rmse_q_2     = rmse_q_2;
summary.rmse_qv_2    = rmse_qv_2;
summary.rmse_ql_2    = rmse_ql_2;
summary.rmse_cloud_fraction = rmse_cloud;

% -------------------------------------------------------- %
% START OF CLOUD STATISTICS
% -------------------------------------------------------- %
summary.mean_cloud_fraction = 0;
summary.mean_w_cloud_base = 0;
summary.mean_z_cloud_base = 0;
summary.mean_z_cloud_top  = 0;
summary.variation_cloud_base = 0;
summary.variation_cloud_top  = 0;
summary.total_t_cloud = 0;
summary.total_i_cloud = 0;
summary.t_cloud_start = 0;
summary.t_cloud_stop  = 0;

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
        
        if summary.t_cloud_stop == 0
            summary.t_cloud_start = new.t;
        end
        summary.t_cloud_stop = new.t;
        
        % Vertical integration of cloud fraction
        cloud_fractionp = SCM.cloud_fraction(1:length(SCM.zp),kt) + SCM.cloud_fraction(2:length(SCM.zw),kt);
        summary.mean_cloud_fraction = summary.mean_cloud_fraction + sum(cloud_fractionp.*transpose(SCM.zp))./sum(SCM.zp);
    
        
        % Update cloud boundary contributions
        summary.mean_z_cloud_base = summary.mean_z_cloud_base + new.z_cloud_base;
        summary.mean_z_cloud_top  = summary.mean_z_cloud_top  + new.z_cloud_top;
        
        if old.z_cloud_base > 100
            % Update total cloud lifetime
            dt = new.t - old.t;
            summary.total_t_cloud = summary.total_t_cloud + dt;
            
            % Update cloud base effective vertical velocity contribution
            summary.mean_w_cloud_base = summary.mean_w_cloud_base ...
                                      + (new.z_cloud_base-old.z_cloud_base)/dt;
            
            % Update total variation of cloud boundaries
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
summary.mean_cloud_fraction = summary.mean_cloud_fraction/summary.total_i_cloud;

disp(" ");
disp("CLOUD STATISTICS SUMMARY");
if summary.total_i_cloud >= 2
    disp(sprintf('Total cloud life:  %0.2f hrs (steps: %0.0f)', summary.total_t_cloud/3600, summary.total_i_cloud));
    disp(sprintf('Mean cloud frac:   %0.6f', summary.mean_cloud_fraction));
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


% -------------------------------------------------------- %
% START OF VERTICAL PROFILE STATISTICS
% -------------------------------------------------------- %
for kt = 1:min(length(settings.times_to_plot), length(SCM.times))
    t = settings.times_to_plot(kt);
    [SCM.t, SCM.i] = min(abs(SCM.times - t));
    
    summary.profiles_t(kt) = t;
    summary.profiles_min_theta_1(kt) = min(SCM.th_1(:,SCM.i));
    summary.profiles_min_theta_2(kt) = min(SCM.th_2(:,SCM.i));
    summary.profiles_max_q_1(kt) = max(SCM.q_1(:,SCM.i));
    summary.profiles_max_q_2(kt) = max(SCM.q_2(:,SCM.i));
    summary.profiles_max_qv_1(kt) = max(SCM.qv_1(:,SCM.i));
    summary.profiles_max_qv_2(kt) = max(SCM.qv_2(:,SCM.i));
    summary.profiles_max_ql_1(kt) = max(SCM.ql_1(:,SCM.i));
    summary.profiles_max_ql_2(kt) = max(SCM.ql_2(:,SCM.i));
    summary.profiles_max_e1_sg(kt) = max(SCM.e1_sg(:,SCM.i));
    summary.profiles_max_e2_sg(kt) = max(SCM.e2_sg(:,SCM.i));
    
end

% -------------------------------------------------------- %
% END OF VERTICAL PROFILE STATISTICS
% -------------------------------------------------------- %

% Write summary statistics to file
filename = fullfile(settings.folders.data_scm, 'summary.mat');
save(filename, '-struct', 'summary');