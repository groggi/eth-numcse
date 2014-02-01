% clean up
close all;

% gegebene Datenwerte
x = [0.7; 3.3; 5.6; 7.5; 6.4; 4.4; 0.3; -1.1];
y = [4; 4.7; 4; 1.3; -1.1; -3; -2.5; 1.3];

% erratene Werte
r0 = 1;
m0 = [mean(x); mean(y)];

figure;

% Kreis plotten
hold on;
axis equal; % idee aus ML

plot(x, y, 'r+'); % gegebene Datenpunkte
[m, r] = circ_geo_fit_gauss(x, y, m0, r0);
t = (0:0.01:2) * pi; % aus ML
plot(m(1) + r * cos(t), m(2) * r * sin(t), 'b');

