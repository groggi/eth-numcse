% based on solution
n = 3;
N = 2 * n + 1;
NN = 100 * N;

lambda = 1;
ts = linspace(0, 1, N);
xs = linspace(0, 1, NN);

figure;
hold on;
colors = 'rgbcmk';

for i = 1:N
  ys = zeros(1, N);
  ys(i) = 1;
  ps = zeros(1, NN);
  for j = 1:NN;
    p(j) = problem17c(ts, ys, lambda, xs(j));
  end
  
  plot(xs, p, colors(mod(i, 6) + 1));
end

plot(ts, ones(1, N), 'ro');