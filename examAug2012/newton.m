function [x, res] = newton(n)
  A = gallery('poisson', n);
  b = ones(n*n, 1);
  
  x = A \ b;
  
  F = @(A, x, b) (A + (x') * x * eye(n*n)) * x - b;
  dF = @(A, x) A + 2 * x * (x') + (x') * x * eye(n*n);
  
  rtol = 10e-6;
%   atol = 10e-8; ??
  
  i = 0;
  last_x = 0;
  while(norm(last_x - x) / norm(x) > rtol)
    last_x = x;
    x = x - dF(A, x) \ F(A, x, b);
    
    i = i + 1;
  end
  
  res = 0; % unknown, we don't have "dampnewton" :)
  
  display(i);
end

