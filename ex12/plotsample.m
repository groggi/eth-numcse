function plotsample()
  m = 2;
  n = 2;
  
  for f = 1:m*n
     B = setFocus(f - 1);
     subplot(m, n, f);
     image(B);
     colormap((0:1/215:1)' * [1, 1, 1]);
  end
end

