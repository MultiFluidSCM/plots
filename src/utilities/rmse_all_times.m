function rmse_total = rmse_all_times(t_LES, z_LES, field_LES, t_SCM, z_SCM, field_SCM)

% Compare profiles below this threshold in seconds
threshold = 300;

% Remove any NaN values which would spoil the analysis
field_LES(isnan(field_LES)) = 0;
field_SCM(isnan(field_SCM)) = 0;

% Cycle through the available vertical profiles of the SCM
rmse_total = 0;
for i=1:length(t_SCM)
    % Check if there are any available LES profiles close enough (in time) to be comparable
    [dt_min, j] = min(abs(t_LES - t_SCM(i)));
    
    if dt_min < threshold
        sprintf('Calculating RMSE between SCM at %d:.0f s and LES at %d:.0f s', t_SCM(i), t_LES(j));
        
        % Arrays must be the same length for rmse function
        length_LES = length(z_LES);
        length_SCM = length(z_SCM);
        cutoff = min(length_LES, length_SCM);
        
        % Fields should be evaluated at the same z-coordinates
        field_LES_processed = field_LES(1:cutoff,j);
        field_SCM_processed = interpolate_timeseries(z_LES(1:cutoff), z_SCM(1:cutoff), field_SCM(1:cutoff,i));
        
        % Add a normalisation to make it easier to compare deviations of different variables
        normalisation = mean(abs(field_LES_processed));
        
        rmse_total = rmse_total + rmse(field_LES_processed, field_SCM_processed)/normalisation;
    end
end

end

