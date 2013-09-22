function x = quadraticSolve(a, b, c)
% Exercise 1, Problem 3a
% solves functions of the form
% ax^2 + bx + c = 0
% a, b, c are real numbers

% calculate parts
r = sqrt(b^2 - 4*a*c);

% calculate both results
x = [(-b + r)/(2*a); (-b - r)/(2*a)];

end

