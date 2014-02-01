function x = normaleq(A, b)

% Step 1: normal equation: A_norm * x = b_norm
A_norm = A' * A;
b_norm = A' * b;

% Step 2: cholesky factorization: L * L' = A_norm
L = chol(A_norm);

% Step 3: forward substitution
y = L' \ b_norm;

% Step 4: backward substitution
x = L \ y;

end

