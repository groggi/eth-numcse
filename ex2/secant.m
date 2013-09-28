% problem 1: (1c) (iv)

function [x, iters, interim] = secant(func, x0, x1, errLim)
  absErr = abs(x1 - x0);
  iters = 0;
  interim = [];
  
  while absErr >= errLim
    iters = iters + 1;
    
    x = x1 - ((func(x1) * (x1 - x0)) / (func(x1) - func(x0)));
    interim = [interim x];
    absErr = abs(x - x1);
    
    x0 = x1;
    x1 = x;
  end
end