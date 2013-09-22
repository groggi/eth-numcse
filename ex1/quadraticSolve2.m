function x = quadraticSolve2(a, b, c)
% Exercise 1, Problem 3c
% used:
%  - Book: p. 28
%  - http://mathworld.wolfram.com/QuadraticEquation.html
%  - https://en.wikipedia.org/wiki/Quadratic_equation#Vieta.27s_formulas

% calculate parts
r = sqrt(b^2 - 4*a*c);

% calculate result
if b > 0
  x1 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
else
  x1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
end

x = [x1; c/x1];

end

