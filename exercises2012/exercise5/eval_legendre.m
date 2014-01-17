function [P, dP] = eval_legendre(n, t)
  t = t(:)'; % make sure is rowvector
  
  P = zeros(n+1, length(t));
  P(1, :) = ones(1, length(t));
  P(2, :) = t;
  
  c1 = (2 * (n - 1) + 1)/((n - 1) + 1) .* t;
  c2 = (n - 1) / n;
  
  dP = zeros(n+1, length(t));
  dP(1, :) = zeros(1, length(t));
  dP(2, :) = ones(1, length(t));
  
  c3 = (2 * n + 1)/(n+1);
  
  for i = 3:n+1
    P(i, :) = c1 .* P(i-1, :) - c2 * P(i-2, :);
    dP(i, :) = c3 .* dP(i-1, :);
  end
  
%   P = P(n+1, :)';
%   dP = dP(n+1, :)';

end

