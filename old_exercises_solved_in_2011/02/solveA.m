function x = solveA( d1,c,d2,b )
n = length(b) / 2;

% Matrix A:
% d1   c   |  b
% c    d2  |  b
A = [ [d1, c; c, d2], b];

for col = 1:n
    % pivot finden
    [value, pos] = max(abs(A([k k+n], 1)))
end

end

