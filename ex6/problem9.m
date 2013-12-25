% input data
tol = 10e-5;
maxiter = 10e5;
pows = 3:5;
Ns = 2 .^ pows - 1;

for N = Ns
  n = N^2;
  A = gallery('poisson', N);
  b = ones(n, 1) ./ (N + 1)^2;
  
  cond = (4 - 4 * cos(N * pi/(N + 1)))/(4 - 4 * cos(pi/(N + 1)));
  
  %
  % Jacobi Method (9b, 9c)
  %
  d = diag(A);
  
  x_j = zeros(n, 1);
  r_j = b - A * x_j;
  
  tic;
  for itercount = 1:maxiter
    if norm(r_j) < tol * norm(b)
      break;
    end
    
    x_j = x_j + r_j ./ d;
    r_j = b - A * x_j;
  end
  
  fprintf('Jacobi: N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  %
  % Gauss-Seidel (9d)
  %
  E = tril(A);
  
  x_g = zeros(n, 1);
  r_g = b - A * x_g;
  
  tic;
  for itercount = 1:maxiter
    if norm(r_g) < tol * norm(b)
      break;
    end
    
    x_g = x_g + E \ r_g;
    r_g = b - A * x_g;
  end
  
  fprintf('Gauss-Seidel : N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  %
  % Successive Over-Relaxtion (SOR) (9e)
  %
  w_sor = 2 / (1 + sin(pi/(N+1))); % slide 30, lecture 10
  % SOR based on Gauss-Seidel
  M_sor = (1 / w_sor) * ((1 - w_sor) * diag(d) + w_sor * tril(A));
  
  x_sor = zeros(n, 1);
  r_sor = b - A * x_sor;
  
  tic;
  for itercount = 1:maxiter
    if norm(r_sor) < tol * norm(b)
      break;
    end
    
    x_sor = x_sor + M_sor \ r_sor;
    r_sor = b - A * x_sor;
  end
  
  fprintf('SOR Jacobi: N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  %
  % Conjugate Gradient (CG) without preconditioning (9f)
  %
  tic;
  [x_cg, ~, ~, itercount] = pcg(A, b, tol, maxiter);
  fprintf('CG without preconditioning: N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  %
  % Conjugate Gradient (CG) with Jacobi preconditioning (9g)
  %
  tic;
  M = diag(d);
  [x_cgp, ~, ~, itercount] = pcg(A, b, tol, maxiter, M);
  fprintf('PCG with Jacobi: N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  %
  % Conjugate Gradient (CG) with IC (9h)
  %
  tic;
  L = ichol(A);
  [x_cgp, ~, ~, itercount] = pcg(A, b, tol, maxiter, L, L');
  fprintf('PCG with IC: N=%d, cond=%1.2e, iters=%d, time=%1.2e\n', ...
    N, cond, itercount, toc);
  
  fprintf('\n');
end