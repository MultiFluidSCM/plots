% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

clear

[folders] = get_folders();
[settings] = get_settings(folders);

load_les_data
load_scm_data

%Book-keeping and extra variables
additional_diagnostics

%Plot each profile for each saved time
plot_individual_profiles
%Combine individual profiles for multi-panel plots
plot_profile_combinations

%plot_mean_profiles
%plot_higher_moments
plot_timeseries