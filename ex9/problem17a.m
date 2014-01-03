function [V, b] = problem17a(ts, ys, lambda)
  ts = ts(:);
  ys = ys(:);
  
  b = ys .* exp(-lambda * ts * length(ts));
  V = vander(exp(lambda * ts));
end