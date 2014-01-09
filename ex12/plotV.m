function plotV()
  fs = linspace(0, 5, 100);
  
  
  
  Vf = zeros(length(fs), 1);
  i = 1;
  for f = fs
    Vf(i) = calcV(f);
    
    i = i+1;
  end
  
  plot(fs, Vf);
end

