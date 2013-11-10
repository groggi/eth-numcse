function [x, A] = sparselu(v, w, u, b)
  n = size(v, 1);
  B = [v [0; w] [u; 0; 0]];
  
  A = spdiags(B, [0, 1, -2], n, n);
  
  [L, U, P] = lu(A);
  
  c = L \ P*b;
  x = U \ c;
  
end

