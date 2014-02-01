function [P, dP] = eval_legendre(n, t)
% Berechnet für das i-te Element von t jeweils das n-te Legendre Polynom
% (P) und die Ableitung des n-ten Legendre Polynoms (dP)

element_count = length(t);

if n==0 % aus ML: hab nicht an n=0 gedacht
    P = ones(element_count);
    dP = zeros(element_count);
    return;
else
    % Wir verwenden jeweils eine 2 x n - Matrix um die letzten zwei
    % berechneten Werte uns zu merken. Will man P_(n+1) berechnen, so ist
    % die erste Spalte der Matrix P_(n-1) und die zweite P_n.
    
    %    v- ist P_0 nach Def.    v- ist P_1 nach Def.
    P = [ones(element_count, 1) t];
    
    %     v- ist P'_0 nach Def.    v- ist P'_1 nach Def.
    dP = [zeros(element_count, 1) ones(element_count, 1)];
end

% berechnen des Legendre Polynoms indem wir über n iterieren und es langsam
% aufbauen
for grad = 1:n-1
    % Beide Brüche berechnen, damit die nachfolgenden Berechnungen lesbarer
    % werden. Siehe dazu das Antwortenblatt (Formeln).
    K_1 = (2*grad + 1)/(grad+1);
    K_2 = grad/(grad+1);
    
    P_n = P(:, 2);
    
    % P_(n+1) berechnen mittels P_(n-1) und P(n)
    P = [
            P_n... % verschiebe die zweite Spalte (P_n) in die erste Spalte (P_(n-1)).
            K_1 * P(:, 2) .* t - K_2 * P(:, 1) % berechne P_(n+1) und lege es in die zweite Spalte (P_n)
        ];
    
    dP = [
            dP(:, 2)... % verschiebe die zweite Spalte (P'_n) in die erste Spalte (P_(n-1)).
            K_1 * (P_n + dP(:, 2) .* t) - K_2 * dP(:, 1) % berechne P'_(n+1) und lege es in die zweite Spalte (P_n)
        ];
end

P = P(:,2); % extract P_n
dP = dP(:, 2); % extract P'_n
