function [alpha, beta] = lsqest(z, c)
  z = z(:);
  c = c(:);
  
  A = zeros(length(z), 2);
  A(:, 1) = z; % * alpha
  A(:, 2) = [0; z(1:end-1)] + [z(2:end); 0]; 
  
  [Q, R] = qr(A);
  y = Q' * c;
  x = R \ y;
  
  alpha = x(1);
  beta = x(2);
end

