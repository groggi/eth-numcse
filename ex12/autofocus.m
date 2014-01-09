function f0 = autofocus()
  Df = @(f) (calcV(f) - calcV(f - 0.025)) / (0.025);
  
  tol = 1e-6;
  a = 0;
  b = 5;
  
  maxiter = 1e10;
  for i = 1:maxiter
    f0 = (a + b) / 2;
    Dfc = Df(f0);
    if Dfc == 0 || (b-a) < tol
      break;
    end
    
    if sign(Dfc) == sign(Df(a))
      a = f0;
    else
      b = f0;
    end
  end
  
  display(i);
  
end

