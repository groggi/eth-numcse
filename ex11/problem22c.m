hold on;


xs = -1:0.001:1;

for k = 0:6
  color = rand(3, 1);
  P = eval_legendre(k, xs);
  plot(xs, P, 'Color', color, 'DisplayName', strcat('k = ', int2str(k)));
end

legend('show');