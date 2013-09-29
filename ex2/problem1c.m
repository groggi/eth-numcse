func = @(x) x + log(x); % our f(x)
funcD = @(x) 1 + (1/x); % f'(x)
funcG = @(x) exp(-x); % the g(x) I use

x0 = 0.5;
x1 = 0.6;
errLim = 1e-10;

% get the «good» answer from matlab
expectedX = fzero(func, x0);
fprintf('fzero returns x = %0.10f\n', expectedX);

% bisect
[bisectX, bisectIters, bisectInterim] = bisect(func, x0, x1, errLim);
fprintf('Bisect needed %i iterations for x = %0.10f\n', bisectIters, bisectX);

subplot(4, 4, 1);
plot(bisectInterim, '*');
hold on
plot(1:bisectIters, ones(size(1:bisectIters)) * expectedX, 'r--');
hold off
title('Bisect: interim values');
xlabel('iteration');

subplot(4, 4, 2);
bisectAbsErrorSteps = abs(bisectInterim - expectedX);
semilogy(bisectAbsErrorSteps);
title('Bisect: absolute error to fzero');
xlabel('iteration');

subplot(4, 4, 3);
bisectRelErrorSteps = bisectAbsErrorSteps ./ abs(bisectInterim);
semilogy(bisectRelErrorSteps);
title('Bisect: relative error to fzero');
xlabel('iteration');

subplot(4, 4, 4);
bisectValueErrorSteps = abs(func(bisectInterim));
plot(bisectValueErrorSteps, '+');
title('Bisect: error based on function value');
xlabel('iteration');

% fixed point
[fixedX, fixedIters, fixedInterim] = fixedPointIter(funcG, x0, errLim);
fprintf('Fixed Point Iteration needed %i iterations for x = %0.10f\n', fixedIters, fixedX);

subplot(4, 4, 5);
plot(fixedInterim, '*');
hold on
plot(1:fixedIters, ones(size(1:fixedIters)) * expectedX, 'r--');
hold off
title('Fixed Point Iteration: interim values');
xlabel('iteration');

subplot(4, 4, 6);
fixedAbsErrorSteps = abs(fixedInterim - expectedX);
semilogy(fixedAbsErrorSteps);
title('Fixed Point Iteration: absolute error to fzero');
xlabel('iteration');

subplot(4, 4, 7);
fixedRelErrorSteps = fixedAbsErrorSteps ./ abs(fixedInterim);
semilogy(fixedRelErrorSteps);
title('Fixed Point Iteration: relative error to fzero');
xlabel('iteration');

subplot(4, 4, 8);
fixedValueErrorSteps = abs(func(fixedInterim));
plot(fixedValueErrorSteps, '+');
title('Fixed Point Iteration: error based on function value');
xlabel('iteration');

% newton
[newtonX, newtonIters, newtonInterim] = newton(func, funcD, x0, errLim);
fprintf('Newton needed %i iterations for x = %0.10f\n', newtonIters, newtonX);

subplot(4, 4, 9);
plot(newtonInterim, '*');
hold on
plot(1:newtonIters, ones(size(1:newtonIters)) * expectedX, 'r--');
hold off
title('Newton: interim values');
xlabel('iteration');

subplot(4, 4, 10);
newtonAbsErrorSteps = abs(newtonInterim - expectedX);
semilogy(newtonAbsErrorSteps);
title('Newton: absolute error to fzero');
xlabel('iteration');

subplot(4, 4, 11);
newtonRelErrorSteps = newtonAbsErrorSteps ./ abs(newtonInterim);
semilogy(newtonRelErrorSteps);
title('Newton: relative error to fzero');
xlabel('iteration');

subplot(4, 4, 12);
newtonValueErrorSteps = abs(func(newtonInterim));
plot(newtonValueErrorSteps, '+');
title('Newton: error based on function value');
xlabel('iteration');

% secant
[secantX, secantIters, secantInterim] = secant(func, x0, x1, errLim);
fprintf('Secant needed %i iteration for x = %0.10f\n', secantIters, secantX);

subplot(4, 4, 13);
plot(secantInterim, '*');
hold on
plot(1:secantIters, ones(size(1:secantIters)) * expectedX, 'r--');
hold off
title('Secant: interim values');
xlabel('iteration');

subplot(4, 4, 14);
secantAbsErrorSteps = abs(secantInterim - expectedX);
semilogy(secantAbsErrorSteps);
title('Secant: absolute error to fzero');
xlabel('iteration');

subplot(4, 4, 15);
secantRelErrorSteps = secantAbsErrorSteps ./ abs(secantInterim);
semilogy(secantRelErrorSteps);
title('Secant: relative error to fzero');
xlabel('iteration');

subplot(4, 4, 16);
secantValueErrorSteps = abs(func(secantInterim));
plot(secantValueErrorSteps, '+');
title('Secant: error based on function value');
xlabel('iteration');