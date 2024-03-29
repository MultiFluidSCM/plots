function save_figure(settings, fig, filename)
    disp(fullfile(settings.folders.figures, join([filename,".fig"], "")));
    if settings.save_figures
        hgsave(fig, fullfile(settings.folders.figures, join([filename,".fig"], ""))); 
    end
    
    if settings.save_images
        saveas(fig, fullfile(settings.folders.images,  join([filename,".png"], ""))); 
    end
end