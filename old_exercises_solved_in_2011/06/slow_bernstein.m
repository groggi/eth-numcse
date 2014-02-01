function B = slow_bernstein(n, t)
    % Dies ist die einfachste Version, auf die ich von selbst gekommen bin.
    % Die andere Version ist die performante! Diese verwende ich einfach
    % zur Kontrolle und um zuerst einmal das ganze besser zu verstehen.
    %
    % t ein Vektor, dessen Elemente in [0, 1] liegen
    % n eine Natürliche Zahl (mit 0)
    % i = 0, 1, ..., n
    % 
    % Eingesetzte Hilfen:
    %   - http://de.wikipedia.org/wiki/Bernsteinpolynom
    %   - http://mathworld.wolfram.com/BernsteinPolynomial.html
    %
    % B ist eine length(t) x n Matrix. Die k-te Zeile beinhaltet die
    % Auswertung des Bernstein Polynoms für das k-te Element (Punkt) in t.
    % Die l-te Spalte von B entspricht der Auswertung der gegebenen Punkte
    % für i = l.
    %
    % Code sollte stimmen, wurde mit sol_bernstein.m Ausgabe verglichen.
    
    B = zeros(length(t), n);
    
    for i = 0:n
        % (1-t) ist wieder ein Vektor
        B(:, i + 1) = nchoosek(n, i) * (1 - t).^(n-i) .* t.^i;
    end
end

