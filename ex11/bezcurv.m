function bezcurv(d)
% d is a 2 x n matrix

  xs = 0:0.001:1;
  n = size(d, 2);
  
  B = mybernstein(n - 1, xs);
  P = d * B; % lecture 19, slide 26, first equation

  hold on;
  hullinds = convhull(d(1, :), d(2, :)); % get indices of conv. hull. points
  fill(d(1, hullinds), d(2, hullinds), [0.5 0.6 0.7]  ); % fill conv. hull.
  plot(d(1, :), d(2, :), 'r+'); % plot given points
  plot(P(1, :), P(2, :), 'g-'); % plot curve
end

