%
% given data
%
A = [4 -1 1;-2 5 1;1 -2 5];
b = [5;11;12];

%
% as described by slides & book
%
D_inv = inv(diag(diag(A)));

x_k = zeros(length(A), 1)
r_k = b - A * x_k;

while abs(r_k) > 1e-10 * abs(b)
  x_k = x_k + D_inv * r_k
  r_k = b - A * x_k;
end

%
% method without using A itself but L, R, D
% x_k rewritten to
% x_k = inv(D) * b - inv(D) * (L + R) x_k
%

L = tril(A) - diag(diag(A));
R = triu(A) - diag(diag(A));

x_k = zeros(length(A), 1)

for i=1:10
  x_k = D_inv * b - D_inv * (L+R) * x_k
end