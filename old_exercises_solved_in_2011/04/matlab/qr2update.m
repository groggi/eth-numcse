function x = qr2update(A, b, U, V)
% A ist eine MxN-Matrix
% B ist ein M-Vektor
% U ist eine Mx2-Matrix
% V ist eine Mx2-Matrix
% Grundidee: Wir wenden qrupdate zuerst auf die erste Spalte von U und V an
% und dann auf die zweite.

% Schritt 1: QR-Zerlegung auf A anwenden
[Q, R] = qr(A);

% Schritt 2: qrupdate auf Q und R anwenden, wobei wir zuerst die erste
% Spalte von U und V dafür verwenden.
[Q, R] = qrupdate(Q, R, U(:,1), V(:,1));

% Schritt 3: Wie Schritt 2, nur diesmal verwenden wir die zweite Spalte
% von U und V
[Q, R] = qrupdate(Q, R, U(:,2), V(:,2));

% Schritt 4: Wir verwenden den gleichen Code wie in qrsolve zum Lösen nach
% x. Für Details siehe qrsolve.m
b_transformed = Q' * b;
x = R \ b_transformed;
end

