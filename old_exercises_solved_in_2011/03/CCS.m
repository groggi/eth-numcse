function [val, row_ind, col_ptr] = CCS(A)
% val: enthält die von 0 verschiedenen Elemente von A
% row_ind: gibt an in welcher Zeile der Wert in val liegt
% col_ptr: gibt an welche Elemente von val/row_ind eine neue Spalte starten

% [x, y, z] = find(A) liefert:
% x: Gibt an in welche Spalte (da transponiert: in welche Zeile) das
%       Element gehört
% y: Gibt an in welche Zeile (da transponiert: in welche Spalte) das
%       Element gehört
% z: Die eigentlich Werte, die ungleich 0 sind
[row_ind, col_ind, val] = find(A); % selber drauf gehommen

[0; col_ind; size(A,2) + 1]
col_ptr = find(diff([0; col_ind; size(A,2) + 1])); % aus ML, bin auf keine eigene Idee auf
                                                   % Anhieb gekommen, ohne mühsame Schleifen
end
