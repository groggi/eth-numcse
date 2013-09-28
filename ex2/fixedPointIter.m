% problem 1: (1c) (ii)

function [x, iters, interim] = fixedPointIter(func, x0, errLim)
  xold = x0;
  absErr = errLim + 1; % some value that is >= stopCrit
  iters = 0;
  interim = [];
  
  while absErr >= errLim
    xnew = func(xold);
    interim = [interim xnew];
    
    absErr = abs(xold - xnew);
    xold = xnew;
    iters = iters + 1;
  end
  
  x = xnew;
    
end