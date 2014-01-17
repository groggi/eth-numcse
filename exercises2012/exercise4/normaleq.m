function x = normaleq(A, b)
  % page 115
  G = chol(A' * A)';
  c = G \ (A' * b);
  x = G' \ c;
end

