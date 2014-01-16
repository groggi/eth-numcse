function [D, E] = AstructMatDE(a)
  n = length(a);
  
  D = diag(a);
  E = zeros(n);
  
  t = 1:n;
  
  for i = 1:n
    E(i, i:end) = t(1:end - (i - 1));
  end
end

