function x = solvelse(R,v,u,b)
n = length(b) - 1;

% L * y = b lösen nach y
    y = zeros(n + 1, 1);
    % A ist eine n + 1 mal n + 1 Matrix. L hat in den ersten n Zeilen die
    % Identitätsmatrix. Wir können also die ersten n Elemente aus b
    % übernehmen für y
    y(1:n) = b(1:n);
    
    % Das letzte Element (n+1) muss berechnet werden. Im Grunde gilt 

% R * x = y lösen nach x
end