function alphavec = problem17b(ts, ys, lambda)
  ts = ts(:);
  ys = ys(:);
  
  n = (length(ts) - 1) / 2;
  ts_scaled = exp(lambda .* ts);
  ys_scaled = ys .* exp(lambda * ts * n);
  
  alphavec = polyfit(ts_scaled, ys_scaled, 2 * n);
end