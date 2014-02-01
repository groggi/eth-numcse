% Funktion, die wir verwenden möchten
F = @(x) x * exp(x)^-1;

% Werte aus der Aufgabe, die verwendet werden sollen
a = 0;
b = 10;

% c legen wir in die mitte vom Intervall
c = (a + b) / 2;

% Funktionswerte berechnen, damit es nicht mehrmal berechnet wird
Fa = F(a);
Fb = F(b);
Fc = F(c);

% Idee aus ML: Vorgabe prüfen
assert(Fa * Fb <= 0);

% Idee aus ML: "richtigen" Wert berechnen um Fehler anzeigen zu können
correct_zero = fzero(F, 0)

% so lange iterieren, bis wir Prezision des Computers erreichen
while b-a > eps
    null_point = quadapproxzero(a, b, c, Fa, Fb, Fc);
    
    F_null_point = F(null_point); % Funktionswert der Nullstelle berechnen. Nur einmal berechnen, darum Variable
    
    if F_null_point == 0
        break; % Lösung gefunden
    elseif null_point > c % wenn berechnete Nullstelle in [c, b] liegt
        a = c;
        Fa = Fc;
    else % wenn berechnete Nullstelle in [a, c] liegt
        b = c;
        Fb = c;
    end
    
    % c und Fc aktuallisieren für nächste Iteration
    c = null_point;
    Fc = F_null_point;
end

% Fehler anzeigen
err = abs(correct_zero - null_point)