% Compatibility corrections to ensure older scripts can still run the model

% August 2021: Added option to import high-resolution data for different test cases
if not(isfield(settings, "test_case"))
    disp("No test case specified, plotting LES data for the ARM case");
    settings.test_case = "ARM_MONC";
end

% August 2021: New option to choose snapshots to plot (in seconds) to avoid unnecessary delays
if not(isfield(settings, "times_to_plot"))
    disp("No test case specified, plotting LES data for the ARM case");
    settings.times_to_plot = [32400];
end

% August 2021: Option to measure and output the RMSE error with sigma-weighted variables.
% This is particularly important for tuning the model, by putting less weight on areas where
% only a single cloud exists in the LES data (sometimes with extreme values).
if not(isfield(settings, "sigma_weighted_rmse"))
    disp("Using non-sigma-weighted profiles for RMSE calculation");
    settings.sigma_weighted_rmse = false;
end

% October 2021: Added option to choose the variables and weights used for the RMSE calculation
if not(isfield(settings, "weights"))
    disp("No RMSE weights detected, using default weights instead.");
    settings.weights = struct();
end
if not(isfield(settings.weights, "sigma_2"))
    settings.weights.sigma_2 = 1;
end
if not(isfield(settings.weights, "b_2"))
    settings.weights.b_2 = 1;
end
if not(isfield(settings.weights, "w_2"))
    settings.weights.w_2 = 1;
end
if not(isfield(settings.weights, "ww_res2"))
    settings.weights.ww_res2 = 1;
end
if not(isfield(settings.weights, "ww_sg2"))
    settings.weights.ww_sg2 = 1;
end
if not(isfield(settings.weights, "e_2"))
    settings.weights.e_2 = 1;
end
if not(isfield(settings.weights, "e_res2"))
    settings.weights.e_res2 = 1;
end
if not(isfield(settings.weights, "e_sg2"))
    settings.weights.e_sg2 = 1;
end
if not(isfield(settings.weights, "q_2"))
    settings.weights.q_2 = 1;
end
if not(isfield(settings.weights, "qv_2"))
    settings.weights.qv_2 = 1;
end
if not(isfield(settings.weights, "ql_2"))
    settings.weights.ql_2 = 1;
end
if not(isfield(settings.weights, "cloud"))
    settings.weights.cloud = 1;
end

% November 2021: Option to turn off cloud timeseries plots
if not(isfield(settings, "plot_timeseries"))
    settings.plot_timeseries = true;
end