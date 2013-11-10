sizes = 2 .^ (2:1:12);
runs = 5;
iterNr = 1;

fullTimes = zeros(size(sizes, 1), 1);
sparseTimes = zeros(size(sizes, 1), 1);

for n = sizes
  fullT = realmax;
  sparseT = realmax;
  
  for r = runs
    u = rand(n, 1);
    v = rand(n - 1, 1);
    w = rand(n - 2, 1);
    b = rand(n, 1);
    
    % sparse, didn't use `sparselu` as I don't want to measure the time we
    % need to build our sparse matrix.
      B = [u [0; v] [w; 0; 0]];

      A = spdiags(B, [0, 1, -2], n, n);

    tic;
      [L, U, P] = lu(A);

      c = L \ P*b;
      x = U \ c;
    sparseT = min(toc, sparseT);
    
    % full
    fullA = full(A);
    tic;
      [L2, U2, P2] = lu(fullA);
      c2 = L2 \ P2*b;
      x2 = U2 \ c2;
    fullT = min(toc, fullT);
  end
  
  fullTimes(iterNr) = fullT;
  sparseTimes(iterNr) = sparseT;
  
  iterNr = iterNr + 1;
end

loglog(sizes, fullTimes, 'r-*', sizes, sparseTimes, 'b-o');
legend('full matrix', 'sparse matrix');