function [absErr, relErr] = compRoundErr(a, b, c, ownRootFunc)
% Exercise 1, Problem 3b
% compute the error between `quadraticSolve` and Malab's `roots`

quadraticX = ownRootFunc(a, b, c);
rootsX = roots([a, b, c]);

% sort the values, so we compare the right ones with each other
qSortedX = [max(quadraticX), min(quadraticX)];
rSortedX = [max(rootsX), min(rootsX)];

% absolute error
absErr = abs(qSortedX - rSortedX);

% relative error
relErr = abs(qSortedX - rSortedX) ./ abs(qSortedX);


end

