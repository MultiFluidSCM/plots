% Read LES results:

% Default profiles (all fields are NaN by default)
LES = load(fullfile(settings.folders.data_les, 'default','profiles.mat'));
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

% Profiles for test case
file = fullfile(settings.folders.data_les, settings.test_case, 'profiles.mat');

if isfile(file)
    LES_new = load(file);
    
    % Replace default profiles with test case data
    LES_fieldnames = fieldnames(LES_new);
    for z = 1:length(LES_fieldnames)
        LES.(LES_fieldnames{z}) = LES_new.(LES_fieldnames{z});
    end
else
    disp('Could not find LES vertical profiles to compare with');
end
