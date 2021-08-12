function indicate_cloud_base(settings, LES_z_cloud_base, SCM_z_cloud_base, SCM_z_bl_top)
    if settings.indicate_cloud_base
        %rectangle('Position',[-1e3,0,2e3,LES.z_cloud_base],'FaceColor',[0.2 0.2 0.2 0.1],'EdgeColor',[0.2 0.2 0.2 0.1])
        %rectangle('Position',[-1e3,0,2e3,SCM.z_cloud_base],'FaceColor',[0.2 0.2 0.2 0.1],'EdgeColor',[0.2 0.2 0.2 0.1])
        rectangle('Position',[-1e3,0,2e3,SCM_z_cloud_base],'FaceColor',[0.95 0.95 0.95],'EdgeColor',[0.95 0.95 0.95])
        rectangle('Position',[-1e3,0,2e3,LES_z_cloud_base],'FaceColor',[0.9 0.9 0.9],'EdgeColor',[0.9 0.9 0.9])
        %line([-1e3,1e3],[SCM.z_bl_top,SCM.z_bl_top],'color','#999999','linestyle','--')
        
        % Prevent tick labels and axes from being covered up
        set(gca, 'Layer', 'top')
    end
end