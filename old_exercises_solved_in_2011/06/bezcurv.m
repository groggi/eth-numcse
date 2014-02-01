function bezcurv(d, disable_plot_helpers)
% d: Kontrollpunkte, 1. Spalte: x, 2. Spalte: y
% Ich gehe davon aus, dass alle Werte von d im Bereich [0,1] liegen.
%
% Verwendete Hilfsmittel:
%   - http://www.mathworks.ch/ch/help/matlab/ref/convhull.html

% Daten etwas handlicher machen
x_coords = d(1, :);
y_coords = d(2, :);

% Grundlegende Plot Einstellungen
    hold on;
    xlabel('x');
    ylabel('y');
    title('NumCSE Serie 6, Aufgabe 16b');
    
if nargin < 2 || disable_plot_helpers ~= true
% Kontrollpunkte plotten
    plot(x_coords, y_coords, 'r*');
    
% konvexe Hülle plotten
    k = convhull(x_coords, y_coords);
    plot(x_coords(k), y_coords(k), 'b-');
end
    
% Bezier Kurve plotten
    x = 0:0.0001:1;

    B = bernstein(size(d, 2) - 1, x);
    bezcurv_points = d * B;
    
    plot(bezcurv_points(1,:), bezcurv_points(2,:), 'g-');
    
    hold off;

end

