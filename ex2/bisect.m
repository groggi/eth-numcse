% problem 1: (1c) (i)

function [x, iters, interim] = bisect(func, a, b, errLim)

iters = ceil(log2(b - a) - log2(2 * errLim));
interim = [];

for i=1:iters
  midPoint = (a + b) / 2;
  interim = [interim midPoint];
  
  funcMid = func(midPoint);
  
  if (func(a) * func(midPoint)) < 0
    b = midPoint;
  else
    a = midPoint;
  end
end

x = (a + b) / 2;

end

