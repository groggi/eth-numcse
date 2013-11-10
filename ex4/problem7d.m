b = ones(50, 1);

% Typ 1 of A
v = ones(50, 1) * -4;
u = ones(48, 1);
w = ones(49, 1) * 2;

B = [v [0; w] [u; 0; 0]];
A1 = spdiags(B, [0, 1, -2], 50, 50);

[L1, U1, P1] = lu(A1);

spy(L1, 'g');
hold on;
spy(U1, 'r');

% Typ 2 of A
u2 = ones(48, 1);
u2(1) = 10;
u2(3) = 10;
u2(7) = 10;
u2(13) = 10;
u2(23) = 10;
u2(31) = 10;
u2(47) = 10;

B2 = [v [0; w] [u2; 0; 0]];
A2 = spdiags(B2, [0, 1, -2], 50, 50);

[L2, U2, P2] = lu(A2);

figure;
spy(L2, 'g');
hold on;
spy(U2, 'r');