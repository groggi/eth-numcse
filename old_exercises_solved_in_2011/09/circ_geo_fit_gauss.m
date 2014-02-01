function [m, r] = circ_geo_fit_gauss(x, y, r0, m0)
% Input:
%   x, y jeweils Zeilenvektoren, die Messpunkte (x(i), y(i)) darstellen
%   r0 geratener Wert für r
%   m0 Vektor mit zwei elementen m_1, m_2. Geratener Wert für Mittelpunkt (m_1, m_2)
%
% Output:
%   m Vektor mit zwei Elementen. Berechneter Mittelpunkt
%   r Berechneter Radius

z = [m0(:); r0];

while true
    % R berechnen, Idee aus ML vorheriger Teilaufgabe
    R = sqrt( (z(1) - x) .^ 2 + (z(2) - y) .^ 2 );
    
    % Funktion F berechnen, siehe Notizblatt
    F = R - z(3);
    
    % F' berechnen
    DF = [(z(1) - x) ./ R, ...
        (z(2) - y) ./ R, ...
        -ones(size(x))];
    
    % least squares lösen
    s = DF \ F;
    
    % z neu berechnen
    z = z - s;
    
    % Abbruchbedingung
    if norm(s, inf) < 10^-12 % Wert aus ML
        break;
    end
end

% Resultate aus z extahieren
m = z(1:2)
r = z(3)

end

