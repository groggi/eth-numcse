function [Tout, Uout] = myOde(T, u0, v0)
  u0 = u0(:);
  v0 = v0(:);
  n = length(u0);
  y0 = [u0; v0];
  
  % matrix with coefficents for left hand side
  A = spdiags([-ones(n, 1), 2 * ones(n, 1), -ones(n, 1)], [-1:1], n, n);

  f = @(t, y) [...
    y(n+1:2*n); ...
    A \ (y(1:n) .* ([y(1); y(1:n-1)] + [y(2:n);y(n)]))...
    ];
  
  [Tout, Yout] = ode45(f, [0, T], y0);
  Uout = Yout(:, 1:n);
end

