calc_dots = linspace(-1, 1); % the places we calculate the value (the x for which we calculate P_n(x) =: y)

P = eval_legendre_for_plot(6, calc_dots);

plot(calc_dots, P, [-1, 1], [0,0], 'k:', 'linewidth', 2);
title('Legendre Polynom');
legend('n=1', 'n=2', 'n=3', 'n=4', 'n=5', 'n=6');