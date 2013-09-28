func = @(x) x + log(x);
interval = 0.1:0.01:1;

ys = func(interval);

hold off
plot(interval, ys);
hold on
plot(interval, zeros(size(interval)), 'r--');