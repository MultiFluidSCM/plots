function x_new = interpolate_timeseries(t_new, t, x)

% Return the interpolated values of x1 at times t_new

for i=1:length(t_new)
    x_new(i) = interpolate(t, x, t_new(i));
end

end

