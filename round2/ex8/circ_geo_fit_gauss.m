function [m, r] = circ_geo_fit_gauss(x, y, r0, m0)
  x = x(:);
  y = y(:);
  F = @(z) (z(1) - x).^2 + (z(2) - y).^2 - z(3).^2;
  DF = @(z) [2*z(1) - 2 * x, ...
    2 * z(2) - 2 * y, ...
    -2 * z(3) * ones(length(x), 1)];

  x_k = [m0(1); m0(2); r0];
  p_k = 1;
  atol = 10e-6;
  rtol = 10e-3;
  while(norm(p_k) > norm(x_k) * rtol && norm(p_k) > atol)
    p_k = DF(x_k) \ F(x_k);
    
    x_k = x_k - p_k;
  end
  
  m = [x_k(1); x_k(2)];
  r = x_k(3);

end

