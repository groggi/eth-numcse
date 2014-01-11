function plot_bezcurv(d)
  figure;
  hold on;
  
  xs = d(1, :);
  ys = d(2, :);
  n = length(xs);
  a = min(xs);
  b = max(xs);
  
  % plot points
  plot(d(1, :), d(2, :), 'r+');
  
  % plot convex hull
  convexInd = convhull(xs, ys);
  fill(xs(convexInd), ys(convexInd), [0.2 0.5 0.7]);
  
  % bezier
  ts = linspace(0, 1, 100);
  
  plot_ys = zeros(length(ts), 1);
  for i = 0:n-1
    plot_ys = plot_ys + bernstein(i, n-1, ts)' * ys(i+1);
  end
  
  plot(ts .* (b - a) + a, plot_ys, 'r');
  
  function B = bernstein(i, n, t)
    B = (factorial(n)/(factorial(i) * factorial(n-i))) .* (1 - t).^(n-i) .* t.^i;
  end
end

