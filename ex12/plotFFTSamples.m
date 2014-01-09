function plotFFTSamples()
  m = 2;
  n = 2;
  
  for f = 1:m*n
    subplot(m, n, f);
    B = setFocus(f - 1);
    
    F = abs(fft2(B));
    image(F);
    colorbar();
  end
end

