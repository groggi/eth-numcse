% input values
f = @sin; % function we observe
fp = @cos; % actual derivation
x0 = 1.2; % x_0 value

i = -20:0.5:0;
h = 10 .^ i;

% calculate error
err = abs(fp(x0) - ((f(x0 + h) - f(x0 -h)) ./ h));
err_book = abs(fp(x0) - ((f(x0 + h) - f(x0)) ./ h));

% estimated error
estimated_err = abs(-(h .^ 2) .* (1/6) .* f(x0));

% plot
loglog(h, err, 'g-*');
hold on
loglog(h, estimated_err, 'r-.');
loglog(h, err_book, 'm-*'); % err from the book
loglog(h, f(x0)/2*h, 'm+'); % d_err from the book

xlabel('h');
ylabel('Absolute error');
legend('error', 'estimated error', 'error book', 'estimated error book');

hold off