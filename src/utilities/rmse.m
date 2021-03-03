function deviation = rmse(x1, x2)

% Return the root mean squared deviation between arrays x1 and x2

deviation = sqrt( sum((x2-x1).^2 / length(x1), 'all') );

end

