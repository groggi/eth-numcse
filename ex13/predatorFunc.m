predFunc = @(t, y) [...
  (3 - 0.1 * y(2)) * y(1);...
  -(2 - 0.1 * y(1)) * y(2)...
  ];

y0 = [100; 5];

inter = [0, 10];

opts = odeset('RelTol', 100*eps, 'AbsTol', eps);

[Tout, Yout] = ode45(predFunc, inter, y0, opts);

hold on;
plot(Tout, Yout(:, 1), 'r-');
plot(Tout, Yout(:, 2), 'b-');
hold off;