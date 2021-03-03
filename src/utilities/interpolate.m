function y_interpolated = interpolate(x, y, x_interpolated)

% Return y-value at the location of x_interpolated

for i=1:length(x)-1
    if (x(i) <= x_interpolated && x_interpolated < x(i+1))
        y_interpolated = y(i) + (y(i+1) - y(i)).*(x_interpolated-x(i))./(x(i+1) - x(i));
    end
end
% Set to first or last available value if time beyond interpolation range
if x_interpolated < x(1)
    y_interpolated = y(1);
end
if x_interpolated >= x(end)
    y_interpolated = y(end);
end

end

