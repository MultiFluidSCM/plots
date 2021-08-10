% Read LES results:

% Vertical profiles
% Examples of vertical profiles for variable phi
% Mean profile at snapshot 1:                 phi(:,1)
% Fluid 2 mean at snapshot 1:                 phi2(:,1)
% Minimum of all fluids at snapshot 1:        phi_min(:,1)
% Maximum of fluid 2 at snapshot 1:           phi2_max(:,1)
% Resolved variance of fluid 1 at snapshot 1: phiphi_res1(:,1)
% Subgrid variance of fluid 2 at snapshot 1:  phiphi_sg2(:,1)
% Resolved flux of fluid 1 at snapshot 1:     wphi_res1(:,1)
% Subgrid flux of fluid 2 at snapshot 1:      wphi_sg2(:,1)
% Total resolved variance:                    sigma1.*phiphi_res1 + sigma2.*phiphi_res2
% Total resolved flux:                        wphi_res1 + wphi_res2
load(fullfile(settings.folders.test_case, 'vertical_profiles'));

% Cloud properties (high resolution in time)
load(fullfile(settings.folders.test_case, 'cloud_fraction'));
