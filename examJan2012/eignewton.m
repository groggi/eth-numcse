function [eigvec, eigval] = eignewton(A, x, rtol, atol)
  x = x(:);
  n = length(x);
  
  res = [x; (x' * A * x)/(x'*x)];
  p_k = res;
  while(norm(p_k) > rtol * norm(res) && norm(p_k) > atol)
    
    x_k = res(1:end-1);
    l = res(end);
    
    p_k = ([A - l * eye(n), -x_k; -x_k', 0]) \ ...
      ([A * x_k - l * x_k; 1 - 0.5 * norm(x_k)^2]);
    
    res = res - p_k;
  end
  
  eigvec = res(1:end-1);
  eigval = res(end);
end

