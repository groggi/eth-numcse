f = @(t) exp(-3 .* t);
inter_a = 0;
inter_b = 3;

phis = {@(x) ones(size(x)), ...
	@(x) x, ...
  @(x) 0.5 .* (3 .* x.^2 - 1), ...
  @(x) 0.5 .* (5 .* x.^3 - 3 .* x)};

scale = @(t) (2 .* t - inter_a * ones(size(t)) - inter_b * ones(size(t))) ./ (inter_b - inter_a);


%
% plot original function
%
hold on;
xs = inter_a:0.001:inter_b;

plot(xs, f(xs), 'r-');

%
% deg 2
%
deg = 2;
B = zeros(deg + 1, deg + 1);
b = zeros(deg + 1, 1);

for j = 0:deg
  phi = phis{j + 1};
  
  B(j + 1, j + 1) = (inter_b - inter_a) / (2 * j + 1);
  b(j + 1) = quad(@(x) phi(scale(x)) .* f(x), inter_a, inter_b);
end

% display(B);
% display(b);

c = B \ b;

v = @(x) sum([c(1) * phis{1}(scale(x)); c(2) * phis{2}(scale(x)); c(3) * phis{3}(scale(x))]);
plot(xs, v(xs), 'g-');

%
% deg 3 ... yes, code duplicate - no one cares in this case };-)
%
deg = 3;
B = zeros(deg + 1, deg + 1);
b = zeros(deg + 1, 1);

for j = 0:deg
  phi = phis{j + 1};
  
  B(j + 1, j + 1) = (inter_b - inter_a) / (2 * j + 1);
  b(j + 1) = quad(@(x) phi(scale(x)) .* f(x), inter_a, inter_b);
end

% display(B);
% display(b);

c = B \ b;

v = @(x) sum([c(1) * phis{1}(scale(x)); c(2) * phis{2}(scale(x)); c(3) * phis{3}(scale(x)); c(4) * phis{4}(scale(x))]);
plot(xs, v(xs), 'm-');