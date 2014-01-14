xs = [0:0.001:1];
n = 6;
B = bernstein(n, xs);

hold all;
for i = 1:n+1
  plot(xs, B(:, i), 'Color', rand(1, 3));
end
hold off;