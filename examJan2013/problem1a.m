ns = 2.^[1:8];

CholFac = [];
ICholFac = [];
SymrcmFac = [];
for n = ns
  fprintf('n = %i\n', n)
  
  A = delsq(numgrid('C', n))';
  A_nonzero = nnz(A);
  fprintf('\tA nnz = %i\n', A_nonzero);
  
  %
  % Cholesky
  %
  R = chol(A); % A = R' * R;
  R_nonzero = 2 * nnz(R);
  fprintf('\tcholesky: nnz = %i, factor = %i\n', R_nonzero, R_nonzero/A_nonzero)
  CholFac = [CholFac; R_nonzero/A_nonzero];
  
  %
  % incomplete Cholesky
  %
  L = ichol(A); % A = L * L'
  L_nonzero = 2 * nnz(L);
  fprintf('\tincomplete cholesky: nnz = %i, factor = %i\n', L_nonzero, L_nonzero/A_nonzero)
  ICholFac = [ICholFac; L_nonzero/A_nonzero];
  
  %
  % symrcm
  %
  Psymrcm = amd(A);
  R_symrcm = ichol(A(Psymrcm, Psymrcm));
  R_symrcm_nonzero = nnz(R_symrcm);
  fprintf('\tcholesky symrcm: nnz = %i, factor = %i\n', R_symrcm_nonzero, R_symrcm_nonzero/A_nonzero)
  SymrcmFac = [SymrcmFac; R_symrcm_nonzero/A_nonzero];
  
end

loglog(ns, CholFac, 'r-+', ...
  ns, ICholFac, 'b-*', ...
  ns, SymrcmFac, 'g-o');
legend('chol', 'ichol', 'chol symrcm');