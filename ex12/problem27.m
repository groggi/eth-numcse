function problem27(func, interval, corrValue)
  h_base = interval(2) - interval (1);

  ps = 1:8;
  Ns = 2.^ps;
  
  hold on;
  plot(Ns, ones(length(Ns), 1) * corrValue, 'r-');

  I_list = [];
  for N = Ns
    h = h_base / N;

    I = 0;
    for t = 1:N
      I = I + func((t - 1) * h) + func(t * h);
    end
    
    I_list = [I_list; I * (h / 2)];
  end
  
  plot(Ns, I_list, 'b--o');

end