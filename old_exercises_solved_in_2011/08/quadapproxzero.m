function r = quadapproxzero(a, b, c, Fa, Fb, Fc)
% Input: 3 Punkte:
%   (a, Fa),
%   (b, Fb),
%   (c, Fc)

% P Funktion als Matrix A zum Berechnen der Koeefizienten
A = [
    a^2, a, 1;
    b^2, b, 1;
    c^2, c, 1;
];

% Vektor b mit den Resultaten
y = [Fa; Fb; Fc];

% A * x = y nach x lösen
x = A \ y;

% Allgemeine Lösungsformel für quadratische Gleichtungen anwenden
k = (-x(2) + [1, -1] * sqrt(x(2)^2 - 4 * x(1) * x(3))) / (2 * x(1));

% die Nullstelle im Intervall ausgeben
if k(1) >= a && k(1) <= b
    r = k(1);
else
    r = k(2);
end

end

