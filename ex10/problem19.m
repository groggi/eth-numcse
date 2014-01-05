% data
func = @sin;
Dfunc = @cos;

ts = 0:6;
ts = ts(:);

xs = ts(1):0.001:ts(end);

% calc function values
ys = func(ts);
dy0 = Dfunc(ts(1));
dyr = Dfunc(ts(end));

%
% problem 19a
%
res = spline(ts, [dy0; ys; dyr], xs);

%
% problem 19b
%

% numerical derivatives
dy_num = zeros(size(ts));
dy_num(1) = (ys(2) - ys(1)) / (ts(2) - ts(1));
dy_num(end) = (ys(end) - ys(end - 1)) / (ts(end) - ts(end-1));
dy_num(2:end-1) = (ys(3:end) - ys(1:end-2)) ./ (ts(3:end) - ts(1:end-2));

ys_b = zeros(length(xs), 1); % = q(xs)
for i = 1:length(ts) - 1
  % find indeces of points in the current interval
  ind = find(xs >= ts(i) & xs < ts(i + 1));
  
  % calculate hermite spline for interval [t_i, t_{i+1}]
  t = (xs(ind) - ts(i)) / (ts(i + 1) - ts(i)); % lecture 18, slide 16
  % following lines: lecture 18, slide 17
  H1 = 1 - 3 * t.^2 + 2 * t.^3; % h00 in solution
  H2 = 3 * t.^2 - 2 * t.^3; % h01 in solution
  H3 = t - 2 * t.^2 + t.^3; % h10 in solution
  H4 = -t.^2 + t.^3; % h11 in solution
  
  ys_b(ind) = ys(i) * H1 + ys(i + 1) * H2 + dy_num(i) * H3 + dy_num(i+1) * H4;
end
ys_b(end) = ys(end);

%
% plot
%

% plot functions
figure;
hold on;

plot(ts, ys, 'r+');
plot(xs, func(xs), 'r-');

plot(xs, res, 'b-');
plot(xs, ys_b, 'g-');

legend('data points', 'orig. function', '19a', '19b');

% plot errors
figure;
hold on;
plot(xs, res - func(xs), 'b-');
plot(xs, ys_b - func(xs)', 'g-');
