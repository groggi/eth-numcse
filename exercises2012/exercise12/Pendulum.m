function [y, ts] = Pendulum(phi0, tEnd, l, g)
  c = -g/l;
  ts = linspace(0, tEnd, 10000);
  h = ts(2) - ts(1);
  
  f = @(y) [y(2); c * sin(y(1))];
  y = [phi0 zeros(1, length(ts) - 1); zeros(1, length(ts))]; % initial values
  
  for i = 2:length(ts)
    y(:, i) = y(:, i - 1) + h * f(y(:, i-1));
  end
  
%   subplot(2, 1, 1);
%   plot(ts, y(1, :));
%   subplot(2, 1, 2);
%   plot(ts, y(2, :));
end