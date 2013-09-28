% problem 1: (1c) (iii)

function [x, iters, interim] = newton(func, funcD, x0, errLim)
  iters = 0;
  interim = [];
  xprev = x0;
  errAbs = errLim + 1;
  
  while errAbs >= errLim
    iters = iters + 1;
    
    x = xprev - (func(xprev) / funcD(xprev));
    interim = [interim x];
    errAbs = abs(x - xprev);
    
    xprev = x;
  end
end