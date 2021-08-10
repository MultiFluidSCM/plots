% Compatibility corrections to ensure older scripts can still run the model

% August 2021: Added option to import high-resolution data for different test cases
if not(isfield(settings, "test_case"))
    disp("No test case specified, plotting LES data for the ARM case");
    settings.test_case = "ARM";
    settings.folders.test_case = fullfile(settings.folders.data_les, "ARM");
end

% August 2021: New option to choose snapshots to plot (in seconds) to avoid unnecessary delays
if not(isfield(settings, "times_to_plot"))
    disp("No test case specified, plotting LES data for the ARM case");
    settings.times_to_plot = [32400];
end