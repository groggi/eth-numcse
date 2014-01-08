function dft(l)
  func = @(x) x.^2 .* (x + 1).^2 .* (x - 2).^2 - exp(-x.^2) .* sin(x + 1).^2 .* sin(x - 2).^2;
  n = 2*l - 1;
  measure_xs = 0:pi/l:n*pi/l;
  measure_ts = 3/(2*pi) * measure_xs - 1;
  
  func_y = func(measure_ts);
  
  [a0, a, b] = dftcoeff(func_y);
  
  plot_xs = 0:0.01*pi:2*pi;
  plot_ts = 3/(2*pi)*plot_xs - 1;
  approx_ys = dfteval(a0, a, b, plot_xs);
  
  hold on;
%   axis([-1 2 -2 6]);
  plot(plot_xs, func(plot_ts), 'r-');
  plot(plot_xs, approx_ys, 'g-');
end

