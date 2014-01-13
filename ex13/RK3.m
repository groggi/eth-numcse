function [t_steps, y] = RK3(odefun, tspan, y0, N)
 a = tspan(1);
 b = tspan(2);
 t_steps = linspace(a, b, N+1);
 h = (b - a) / N;
 
 y = [y0; zeros(N, 1)];
 
 for i = 1:N
   t_k = t_steps(i);
   
   K1 = odefun(t_k, y(i));
   K2 = odefun(t_k + 1/3 * h, y(i) + 1/3 * h * K1);
   K3 = odefun(t_k + 2/3 * h, y(i) + 2/3 * h * K2);
   
   y(i+1) = y(i) + h * (1/4 * K1 + 3/4 * K3);
 end
end

