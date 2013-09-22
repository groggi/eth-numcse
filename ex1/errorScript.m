disp('small error for: compRoundErr(1, 10^8, 10^6, @quadraticSolve)');
[absErr, relErr] = compRoundErr(1, 10^8, 10^6, @quadraticSolve)

disp('small error for: compRoundErr(1, 10^8, 10^6, @quadraticSolve2)');
[absErr, relErr] = compRoundErr(1, 10^8, 10^6, @quadraticSolve2)

% --

disp('large error for: compRoundErr(1, -10^8, pi, @quadraticSolve)');
[absErr, relErr] = compRoundErr(1, -10^8, pi, @quadraticSolve)

disp('large error for: compRoundErr(1, -10^8, pi, @quadraticSolve2)');
[absErr, relErr] = compRoundErr(1, -10^8, pi, @quadraticSolve2)

% --

disp('large error for: [absErr, relErr] = compRoundErr(1, 10^8, pi, @quadraticSolve)');
[absErr, relErr] = compRoundErr(1, 10^8, pi, @quadraticSolve)

disp('large error for: [absErr, relErr] = compRoundErr(1, 10^8, pi, @quadraticSolve2)');
[absErr, relErr] = compRoundErr(1, 10^8, pi, @quadraticSolve2)