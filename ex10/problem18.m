% basic data
x_data = 1:5;
x_data = x_data(:);

y_data = [1; 1; 2; 6; 24];

xs = 1:0.001:5;

%
% problem 18a
% polynomial interpolant of degree four
%
V = vander(x_data);
cs_a = V \ y_data;

%
% problem 18b
%
res_b = spline(x_data, y_data, xs);

%
% plot interpolants, data points, gamma function
%
figure(3);
hold on;
plot(x_data, y_data, 'ro'); % data points
plot(xs, gamma(xs), 'r-'); % gamma function itself
plot(xs, polyval(cs_a, xs), 'g-'); % 18a
plot(xs, res_b, 'b-'); % 18b
legend('data points', 'gamma func', '18a', '18b');

%
% plot error
%
figure(4);
hold on;
plot(xs, gamma(xs) - polyval(cs_a, xs), 'g-'); % err 18a
plot(xs, gamma(xs) - res_b, 'b-'); % err 18b