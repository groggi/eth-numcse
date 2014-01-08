function [a0, a, b] = dftcoeff(y)
  y = y(:);
  m = length(y);
  l = m / 2;
  
  x = 0:2*pi/m:(m-1)*2*pi/m;
  
  a = zeros(l, 1);
  b = zeros(l-1, 1);
  
  a0 = sum(y) / l; % cos(k * x_i) for k = 0 => cos(0) = 1 => sum y_k * (1/l). Page 389
  
  % calc a_k and b_k according to page 389 from 1 to l-1
  for k = 1:l-1
    cosVal = cos(k*x);
    sinVal = sin(k*x);
%     display(sinVal);
    
    a(k) = (cosVal * y) / l; % cosVal is row vector and y column vector => cosVal * y = sum[cos(k * x_k) * y_k]
    b(k) = (sinVal * y) / l; % ... same idea ...
  end
  
  a(l) = (cos(l * x) * y) / l; % a_l is needed, but not b_l
  
end

