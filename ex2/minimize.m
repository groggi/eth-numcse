function [localMin, globalMin] = minimize(f, fd, fdd, a, b, nprobe, tol)
  % find critical points
  crit = getroots(fd, a, b, nprobe, tol);
  disp('critical points i.e. d/dx f(x) = 0:');
  disp(crit);
  
  % check which are a local minimum
  x = [];
  globalMin = [intmax intmax];
  
  for i = 1:size(crit, 2)
    if fdd(crit(i)) > 0
      x = [x crit(i)];
      
      v = f(crit(i));
      if v < globalMin(2)
        globalMin = [crit(i) v]; % save the x value and f(x)
      end
    end
  end
  
  % prepare output
  localMin = [x' f(x)'];
end