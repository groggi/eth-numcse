close all;

% Funktionen definieren
Func = @(x) atan(x) - 0.123; % F(x)
DFunc = @(x) 1 / (1 + x^2); % F'(x)

% exakten Wert berechnen als Referenz für Fehlerberechnung
exact = tan(0.123);

% Variabeln für Berechnung vorbereiten
x = 5; % Vektor mit den x Werten, die sich 'exact' nähern sollten
iteration = 0;
errors = abs(exact - x); % Vektor mit Fehlern

while(errors(end) > eps && iteration < 100)
    new_x = ModNewtStep(x(end), Func, DFunc);
    x = [x, new_x];
    errors = [errors, abs(exact - new_x)];
    
    iteration = iteration + 1;
end

% Plot: Daten aufbereiten
log_errors = log(errors); % Fehler logarithmisch betrachten
emp_orders = (log_errors(3:end) - log_errors(2:end-1)) ./ ... % aus ML
    (log_errors(2:end-1) - log_errors(1:end-2));

% Plotten
figure;
semilogy(1:length(errors), errors, 'o-');
