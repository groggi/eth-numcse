function [ m, r ] = circ_geo_fit_gauss(x, y, r0, m0)

x = x(:); % make it a column vector
y = y(:); % make it a column vector
m0 = m0(:); % make it a column vector

R = @(x, y, m1, m2) sqrt((x - m1).^2 + (y - m2).^2);
F = @(x, y, m1, m2, r) R(x, y, m1, m2) - r;
DF = @(x, y, m1, m2) ...
  [(-x + m1) ./ R(x, y, m1, m2), ...
    (-y + m2) ./ R(x, y, m1, m2), ...
    -ones(size(x))];

z = [m0; r0];

run = 1;
while run
  s = DF(x, y, z(1), z(2)) \ F(x, y, z(1), z(2), z(3));
  z = z - s;
  
  run = norm(s, inf) > 1e-12;
end

m = z(1:2);
r = z(3);

end

