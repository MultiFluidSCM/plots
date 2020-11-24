% Read SCM results
%load('SCM_scheme0');     % Basic relaxation detrainment
%load('SCM_scheme0ug1'); % ug = 1 m/s
%load('SCM_scheme1');     % Sorting determines Mij but not etahat, qhat
%load('SCM_scheme3');     % Sorting determines Mij and etahat, qhat
%load('SCM_scheme4'); 
%load('SCM_scheme5');     % Unreproducible result ???
%load('SCM_scheme6x');     % Improved relabelling for variances, incomplete linearization
%load('SCM_scheme6y');     % Improved relabelling for variances, better but still incomplete linearization
%load('SCM_scheme7');     % Replace -dw2/dt by rate of mixing detrainment
%load('SCM_scheme8');     % Improved relabelling for TKE (incomplete linearization)
%load('SCM_scheme9dt5');  % Like scheme8 but only allow sorting where b<0. dt = 5 sec
%load('SCM_scheme10');     % Like scheme9 but with a 'smooth switch' based on b/sigma_b
%load('SCM_scheme10b');    % Like scheme10 but with half the sorting rate
%load('SCM_scheme10e');    % Like scheme10b but different switch normalized on tke/L
%load('SCM_scheme10edt5');   % 10e with dt = 5 sec
%load('SCM_results');

load('SCM_results');
%load('SCM_WAM_scheme0');     % Same as SCM_scheme10 and used as a starting point
%load('SCM_WAM_scheme0_wdetrain_09');     % wdetrain parameter changed from 1.0 to 0.9
%load('SCM_WAM_scheme0_wdetrain_08');
%load('SCM_WAM_scheme0_wdetrain_08_wentrain_08')
%load('SCM_WAM_scheme0_qmixing_05')
% Vertical profiles (219 levels)
% at heights zi (m)
% for 4 times given by time_s (seconds from the start of the simulation)