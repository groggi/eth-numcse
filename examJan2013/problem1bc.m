function problem1bc()
  ns = 2.^(1:8);

  chol_t = [];
  chol_err = [];
  
  ichol_t = [];
  ichol_err = [];
  
  symrcm_t = [];
  symrcm_err = [];
  
  pcg_t = [];
  pcg_err = [];
  
  for n = ns
    A = delsq(numgrid('C', n));
    b = rand(size(A, 1), 1);
    x_corr = A\b;
    
    tic;
    R = chol(A);
    y_chol = R' \ b;
    x_chol = R \ y_chol;
    chol_t = [chol_t; toc];
    chol_err = [chol_err; norm(x_corr - x_chol)];
    
    tic;
    L = ichol(A);
    y_ichol = L \ b;
    x_ichol = L' \ y_ichol;
    ichol_t = [ichol_t; toc];
    ichol_err = [ichol_err; norm(x_corr - x_ichol)];
    
    tic;
    P = symrcm(A);
    L_s = ichol(A(P, P));
    y_symrcm = L_s \ b;
    x_symrcm = L_s' \ y_symrcm;
    symrcm_t = [symrcm_t; toc];
    symrcm_err = [symrcm_err; norm(x_corr - x_symrcm)];
    
    tic;
    M = ichol(A);
    X = pcg(A, b, 10e-3, 20, M', M);
    pcg_t = [pcg_t; toc];
    pcg_err = [pcg_err; norm(x_corr - X)];
  end
  
  subplot(1, 2, 1);
  title('time');
  loglog(ns, chol_t, 'r-+', ...
    ns, ichol_t, 'g-*', ...
    ns, symrcm_t, 'b-o', ...
    ns, pcg_t, 'm-+');
  legend('chol', 'ichol', 'sumrcm ichol', 'pcg');

  subplot(1, 2, 2);
  title('error');
  loglog(ns, chol_err, 'r-+', ...
    ns, ichol_err, 'g-*', ...
    ns, symrcm_err, 'b-o', ...
    ns, pcg_t, 'm-+');
  legend('chol', 'ichol', 'sumrcm ichol', 'pcg');
end