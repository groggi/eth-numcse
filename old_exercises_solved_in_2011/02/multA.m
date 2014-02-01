function y = multA(d1, c, d2, x)
n = length(x) / 2;
y = zeros(n * 2);
% Die Diagonale von A besteht aus d1 und d2. Wir können also jeweils x mit
% d1 und d2 Elementweise multiplizieren und in y ablegen
y = [d1;d2] .* x;

% nun bleiben noch die beiden Diagonalen, die aus c bestehen.
    % oberes C
    y(1:n) = y(1:n) + c .* x(n+1:end);
    
    % unteres C
    y(n+1:end) = y(n+1:end) + c .* x(1:n);
end

