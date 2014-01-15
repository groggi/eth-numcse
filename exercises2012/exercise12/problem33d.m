function problem33d()
  [y, t] = Pendulum(0.8*pi/2, 1.8, 0.6, 9.81);
  y = y(1, :);
  
  f = @(x) func(x, t, y);
  
  fzero(f, 0.44)
  
  function res = func(val, xs, ys)
    ind = find(xs <= val);
    ind = max(ind);
    
    res = ys(ind);
  end
end