function x = qrsolve(A,b)

% step 1: QR decomposition
[Q, R] = qr(A);

% step 2: transform b
b_transformed = Q' * b;

% step 3: backward substitution
x = R \ b_transformed;

end

