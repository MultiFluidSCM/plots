% Read SCM results
% Vertical profiles (219 levels)
% at heights zi (m)
% for 4 times given by time_s (seconds from the start of the simulation)

SCM_temp = load(settings.scm_data);

% Compatibility for older data files.
% Remove the "SCM_" from the variable names
fieldnames_old = fieldnames(SCM_temp);
fieldnames_new = strrep(fieldnames_old, 'SCM_', ''); 
for z = 1:length(fieldnames_old)
    SCM.(fieldnames_new{z}) = SCM_temp.(fieldnames_old{z});
end