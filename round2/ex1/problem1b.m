x_0 = 1.2;

is = -20:0.5:0;
hs = 10.^is;

exact = cos(x_0);
approx = (sin(x_0 + hs) - sin(x_0 - hs)) ./ (2*hs);
expected_err = -(1/6) .* hs.^2 .* -cos(x_0);

loglog(hs, abs(exact - approx), 'b-+');
hold on;
loglog(hs, expected_err, 'r--');