xs = -1:0.001:1;

T = @(j, x) cos(j .* acos(x));

hold on;

for deg = 1:6
  plot(xs, T(deg, xs), 'color', rand(1, 3));
end