x = [0.7, 3.3, 5.6, 7.5, 6.4, 4.4, 0.3, -1.1];
y = [4.0, 4.7, 4.0, 1.3, -1.1, -3.0, -2.5, 1.3];

r0 = 1.0;
m0 = [mean(x), mean(y)]

[m, r] = circ_geo_fit_gauss(x, y, r0, m0)

% draw the circle
rads = 0:pi / 100:2 * pi;
x_circ = r * cos(rads) + m(1);
y_circ = r * sin(rads) + m(2);

plot(x, y, 'ro');
hold on;
plot(m(1), m(2), 'g+');
plot(x_circ, y_circ, 'g-');