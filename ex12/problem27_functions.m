func1 = @(x) abs(sin(x ./ 2));
func1_corrValue = 4;

func2 = @(x) abs(sin(x ./ 2).^3);
func2_corrValue = 8/3;

interval = [0, 2*pi];

figure;
title('sin(x/2)');
problem27(func1, interval, func1_corrValue);

figure;
title('sin(x/2)^3');
problem27(func2, interval, func2_corrValue);