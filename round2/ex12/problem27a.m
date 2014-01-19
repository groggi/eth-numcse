function I = problem27a(func, a, b, N)
  xs = linspace(a, b, N);
  h = xs(2) - xs(1);
  
  % use the formula: h/2 * sum(f(x_i) + f(x_{i+1}))
  cs = [1, 2 .* ones(1, N - 2), 1];
  ys = func(xs);
  
  I = h/2 * (cs * ys');
end

