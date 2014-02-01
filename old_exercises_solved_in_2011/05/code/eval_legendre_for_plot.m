% Copy of eval_legendre with some modifications. Removed all comments as
% they do not apply here anymore

function P = eval_legendre_for_plot(n, t)
element_count = length(t);

t = t(:); % aus ML, kein plan was das soll

if n==0
    P = ones(element_count);
    return;
else
    P = [ones(element_count, 1), t];
end

for grad = 1:n-1
    K_1 = (2*grad + 1)/(grad+1);
    K_2 = grad/(grad+1);
    
    P = [
            P...
            K_1 * P(:, end) .* t - K_2 * P(:, end-1)
        ];
end
