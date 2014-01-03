% based on solution
function p = expipeval(ts, ys, lambda, x)
  ys = ys(:);
  ts = ts(:);
  
  N = length(ys);
  n = (N - 1) / 2;
  
  ts_scaled = exp(lambda .* ts); %st
  x_scaled = exp(lambda * x); %sx
  ys_scaled = ys .* exp(lambda * ts * n); %p
  
  for im = 2:N
    for i0 = im - 1: -1 : 1
      ys_scaled(i0) = (x_scaled - ts_scaled(i0)) * ys_scaled(i0 + 1) - (x_scaled - ts_scaled(im)) * ys_scaled(i0);
      ys_scaled(i0) = ys_scaled(i0) / (ts_scaled(im) - ts_scaled(i0));
    end
  end
  
  p = ys_scaled(1) * exp(-lambda * x * n);
  
end
