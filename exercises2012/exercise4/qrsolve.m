function x = qrsolve(A, b)
  % page 136
  [Q, R] = qr(A);
  c = Q' * b;
  x = R \ c;
end

