function [P, dP] = eval_legendre(n, t)
  t = t(:);
  t = t';
  
  P = zeros(max([2, n + 1]), length(t));
  
  % calc P_n
  fact_1 = (2 * n + 1) / (n + 1);
  fact_2 = n / (n+1);
  
  P(1, :) = ones(1, length(t));
  P(2, :) = t;
%   display(P);
  for i = 2:n
     P(i + 1, :) = fact_1 .* t .* P(i, :) - fact_2 .* P(i - 1, :);
  end
  
  P = P(n + 1, :)';
%   display(P);
  dP = 0; % TODO
end

