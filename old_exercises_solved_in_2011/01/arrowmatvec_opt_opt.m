function y = arrowmatvec_opt_opt(d,a,x)
    % Multiplying a vector with the product of two ``arrow matrices''
    % Arrow matrix is specified by passing two column vectors a and x
    if (length(d) ~= length(a)), error ('size mismatch'); end

    t = a_x(d,a,x); % A * x
    y = a_x(d,a,t); % A * t = A * A * x
end

function t = a_x(d,a,x)
    % A * x berechnen unter Berücksichtigung der Form von A
    % ("Pfeil-Matrix")
    t = d .* x; % Effekt der Diagonalen | O(n)
    t(1:end-1) = t(1:end-1) + (a(1:end-1) * x(end)); % Effekt der letzte Spalte von A | O(n)
    t(end) = t(end) + (a(1:end-1)' * x(1:end-1)); % Effekt der letzten Zeile von A | O(n)
end