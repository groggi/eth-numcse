m = 4;
n = 4;
plots = m * n;

for j = 1:plots
  subplot(m, n, j);
  dft(j);
  title(strcat('l = ', int2str(j)));
end