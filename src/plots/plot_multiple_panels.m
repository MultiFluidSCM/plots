function plot_multiple_panels(settings, name, total)
    profiles_to_plot = {};
    for i=1:total
        file_figure = join([name, '_', num2str(i), '.fig'],"");
        file_figure = fullfile(settings.folders.figures, file_figure);
        profiles_to_plot{end+1} = file_figure;
    end

    %%New figure 
    f = figure(5); 
    clf('reset')
    for i=1:length(profiles_to_plot)

        a2 = subplot(1,total,i); 
        % Open exiting figure 
        f_c = openfig(profiles_to_plot{i}); 
        % Identify axes to be copied 
        axes_to_be_copied = findobj(f_c,'type','axes', '-not', 'tag', 'legend');
        % Identify the Legend
        legend_to_be_copied = findobj(f_c,'type','axes', 'tag', 'legend');
        % Identify the children of this axes 
        chilred_to_be_copied = get(axes_to_be_copied,'children'); 
        % Identify orientation of the axes 
        [az,el] = view; 
        % Copy the children of the axes 
        copyobj(chilred_to_be_copied,a2);
        % If there is a legend
        if isfloat(legend_to_be_copied)
            copyobj(legend_to_be_copied, f);
        end
        % Set the limits and orientation of the subplot as the original figure 
        set(a2,'Xlim',get(axes_to_be_copied,'XLim')) 
        set(a2,'Ylim',get(axes_to_be_copied,'YLim')) 
        set(a2,'Zlim',get(axes_to_be_copied,'ZLim')) 
        set(a2,'title',get(axes_to_be_copied,'title'))
        set(a2,'xlabel',get(axes_to_be_copied,'xlabel'))
        set(a2,'ylabel',get(axes_to_be_copied,'ylabel'))
        view(a2,[az,el]) 
        % One may set other properties such as labels, ticks etc. using the same 
        % idea 
        % Close the figure 
        close(f_c);
    end

    set(f,'position',[0,0,total*200,300]);
    file_output = join([name, '_all'],"");
    save_figure(settings, f, file_output);
end
