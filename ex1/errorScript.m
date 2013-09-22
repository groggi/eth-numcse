disp('small error for: compRoundErr(1, 10^8, 10^6)');
[absErr, relErr] = compRoundErr(1, 10^8, 10^6)

disp('large error for: compRoundErr(1, -10^8, pi)');
[absErr, relErr] = compRoundErr(1, -10^8, pi)

disp('large error for: [absErr, relErr] = compRoundErr(1, 10^8, pi)');
[absErr, relErr] = compRoundErr(1, 10^8, pi)