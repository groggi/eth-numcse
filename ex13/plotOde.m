n = 5;
T = 1;

u0 = [1:n] ./ n;
v0 = -ones(n, 1);

[A, B] = myOde(T, u0, v0);

hold on;
plot(A, B(:, 1));
plot(A, B(:, 2));
plot(A, B(:, 3));
plot(A, B(:, 4));
plot(A, B(:, 5));
hold off;