function [P, dP] = eval_legendre(n, t)
  t = t(:)'; % make sure is rowvector
  
  P = zeros(n+1, length(t));
  P(1, :) = ones(1, length(t));
  P(2, :) = t;
  
  dP = zeros(n+1, length(t));
  dP(1, :) = zeros(1, length(t));
  dP(2, :) = ones(1, length(t));
  
  for i = 3:n+1
    c1 = (2 * (i - 2) + 1)/((i - 2) + 1) .* t;
    c2 = (i - 2) / (i - 1);
    c3 = (2 * i)/(i);
  
    P(i, :) = c1 .* P(i-1, :) - c2 .* P(i-2, :);
    dP(i, :) = c3 .* (P(i-1, :) + t .* dP(i-1, :)) - c2 .* dP(i-2, :);
  end
  
%   P = P(n+1, :)';
%   dP = dP(n+1, :)';

end

