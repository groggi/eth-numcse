function x1 = ModNewtStep(x0, F, DF)
% Input:
%   x0 ist unser "start Wert"
%   F eine skalare Funktion
%   DF die Ableitung von F (F') als Funktion

y0 = x0 + DF(x0)^-1 * F(x0); % y^(0) berechnen

x1 = y0 - DF(x0)^-1 * F(y0); % x^(1) berechnen


end
