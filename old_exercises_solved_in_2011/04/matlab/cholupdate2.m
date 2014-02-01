function x = cholupdate2(A, R, u, v, b)

% Antwortenblatt ansehen für Details:
alpha = [v, A' * u] * [sqrt(u' * u); 1 ./ sqrt(u' * u)];
beta = [v, A' * u] * [0; 1 ./ sqrt(u' * u)];


% Schritt 1: Erste Rang-1 Modifikation (alpha)
R = cholupdate(R, alpha); % => R = R + alpha * alpha'

% Schritt 2: Zweite Rang-1 Modifikation (Beta)
R = cholupdate(R, beta, '-'); % => R = R - beta * beta'

% x berechnen durch Normalengleichung wie bei 10a, nur dass die Cholesky
% Zerlegung bereits gemacht wurde
y = (A + u * v')' * b;
x = R' \ y; % vorwärts Einsetzen
x = R \ x; % rückwärts Einsetzen

end

