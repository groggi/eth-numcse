% the function that provides us with data
q = @(t) -11 + 11/3 * t - 17/2 * t.^2 + 7/6 * t.^3;

%
% prepare the data
%
n = 33;
rng(0); % fixed seed for constant results

points = linspace(0.9, 4.1, n);
noise = randn(1, n);

data = q(points) + noise;

%
% 8a
%
[P1, S1, MU1] = polyfit(points, data, n - 1);
q1 = @(t) polyval(P1, (t - MU1(1)) / MU1(2));

%
% 8b
%
P2 = P1(end - 4:end);
q2 = @(t) polyval(P2, (t - MU1(1)) / MU1(2));

%
% 8c
%
P3 = polyfit(points, data, 3);
q3 = @(t) polyval(P3, t);

%
% plot everything
%
points_fine = linspace(0.9, 4.1, 1000);
plot(points, data, 'mx', ...
  points_fine, q(points_fine), 'g-', ...
  points_fine, q1(points_fine), 'r-', ...
  points_fine, q2(points_fine), 'b-', ...
  points_fine, q3(points_fine), 'm-');

xlim([0.8, 4.2]);
ylim([-70, 0]);

legend('measured data points', ...
  'original polynomial (q(t))', ...
  '8a) interpolating polynomial with degree 32', ...
  '8b) cubic part of 8a', ...
  '8c) cubic approximating polynomial');