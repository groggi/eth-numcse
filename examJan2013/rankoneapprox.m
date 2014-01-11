function x = rankoneapprox(A)
  x = sqrt(diag(A));
  tol = 10e-3;
  n = size(A, 1);
  
  F = @(x) reshape(A, n^2, 1) - reshape(x * x', n^2, 1);
  
  s = -1;
  while(norm(s) > tol * norm(x))
    s = DF(x) \ -F(x);
    x = x + s;
  end
end

