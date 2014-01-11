function len = bezLength(d)
  xs = d(1, :);
  ys = d(2, :);
  n = length(xs);
  a = min(xs);
  b = max(xs);
  % bezier
  ts = linspace(0, 1, 10000);
  
  plot_ys = zeros(length(ts), 1);
  for i = 0:n-1
    plot_ys = plot_ys + bernstein(i, n-1, ts)' * ys(i+1);
  end
  
  plot_xs = ts .* (b - a) + a;
  
  len = 0;
  for i = 2:length(ts)
    len = len + norm([plot_xs(i-1); plot_ys(i-1)] - [plot_xs(i); plot_ys(i)]);
  end
  
  function B = bernstein(i, n, t)
    B = (factorial(n)/(factorial(i) * factorial(n-i))) .* (1 - t).^(n-i) .* t.^i;
  end
end