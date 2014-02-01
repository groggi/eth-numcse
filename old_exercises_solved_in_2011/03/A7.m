% settings
runs = 5;
dimensions = 2.^(2:10);
times_normal = zeros(1, length(dimensions));
times_sparse = zeros(1, length(dimensions));
normal_max_dim = 100;

% measure
for cur_dim_index = 1:length(dimensions)
    dim = dimensions(cur_dim_index); % the current dimension we inspect
    A = gallery('poisson', dim); % get a sparse matrix
    
    % normal implementation (7b)
    if(dim < normal_max_dim) % aus ML, nachdem PC unter Last fast zusammengebrochen ist...
        tic;
        for cur_run = 1:runs
            B = diag(1 ./ diag(A)) * A;
            clear B; % optimiert basierend auf ML
        end
        times_normal(cur_dim_index) = toc;
    end
    
    % sparse implementation (7c)
    tic;
    for cur_run = 1:runs
        C = spdiags(1 ./ spdiags(A), 0, dim^2, dim^2) * A;
        clear C; % optimiert basierend auf ML
    end
    times_sparse(cur_dim_index) = toc;
end

% plot
figure('name', 'Aufgabe 7b & 7c');
loglog(dimensions, times_normal, 'b+',...
    dimensions, times_sparse, 'ro',...
    dimensions, dimensions .^ 2 * min(times_sparse) / 1000, 'k',...
    dimensions(1:6), (dimensions(1:6)) .^ 4 * min(times_sparse)/1000, 'k--',...
    'linewidth', 2);
xlabel('dimension n');
ylabel('average runtime (s)');
title('Aufgabe 5b & 7c');
legend('Normale Methode', 'Sparse Matrix Methode', 'O(n^2)', 'O(n^4)');