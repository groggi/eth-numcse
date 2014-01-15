l = 0.6;
g = 9.81;
tend = 1.8;
c = pi/2;

[y1, t1] = Pendulum(0.8 * c, tend, l, g);
[y2, t2] = Pendulum(0.99 * c, tend, l, g);

plot(t1, y1(1, :), 'r-', ...
  t1, y1(2, :), 'r--', ...
  t2, y2(1, :), 'm-', ...
  t2, y2(2, :), 'm--');
legend('0.8 f', '0.8 df/dt', '0.99 f', '0.99 df/dt');