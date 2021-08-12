function plot_multiple_panels(settings, name, profiles_to_plot, n_columns)
    n_plots = length(profiles_to_plot);
    n_rows = ceil(n_plots/n_columns);
    
    %%New figure 
    f = figure(5); 
    clf('reset')
    for i=1:n_plots
        row = ceil(i/n_columns);
        column = mod(i, n_columns);

        a2 = subplot(n_rows,n_columns,i); 
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
        % Prevent tick labels and axes from being covered up
        set(a2, 'Layer', 'top')
        view(a2,[az,el]) 
        
        
        
        % One may set other properties such as labels, ticks etc. using the same 
        % idea 
        % Close the figure 
        close(f_c);
    end
    
    set(f,'position',[0,0,n_columns*300,n_rows*300]);
    
    
    
    file_output = join(['all_', name],"");
    save_figure(settings, f, file_output);
end
