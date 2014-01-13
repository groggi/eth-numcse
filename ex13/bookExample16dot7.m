dy = @(t, y) -(y.^2);
interval = [1, 2];
y0 = 1;
N = 10;

[t, y] = RK3(dy, interval, y0, N);

hold on;
plot(t, y, 'g-o');
xs = interval(1):0.001:interval(2);
plot(xs, 1./xs, 'b--');
hold off;