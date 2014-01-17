ts = linspace(-1, 1, 1000);
ks = 0:5;

[P, ~] = eval_legendre(max(ks), ts);

hold on;

for i = ks
  plot(ts, P(i+1, :), 'Color', rand(1, 3));
end

hold off;