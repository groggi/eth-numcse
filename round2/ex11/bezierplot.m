function bezierplot(ps, xs, n)
  ps_y = ps(2, :);
  
  % scale [a, b] to [0, 1]
  xs_scaled01 = (xs - min(xs)) ./ (max(xs) - min(xs));
  
  B = bernstein(n, xs_scaled01);
  
  ys = B * ps_y'; % = sum_0^n B_{i,n}(t) * P_i | ys are not scaled to [0,1]!
  
  hold on;
  plot(xs, ys, 'b-');
  plot(ps(1, :), ps(2, :), 'r+');
  hold off;
end
