% problem 2a
function xs = getroots(func, a, b, nprobe, tol)
  probe = linspace(a, b, nprobe);
  xs = [];
  
  for i = 1:(nprobe - 1) % iterate over all intervals
    ai = probe(i);
    bi = probe(i+1);
    
    fai = func(ai);
    fbi = func(bi);
    
    if sign(fai) ~= sign(fbi)
      % function changed sign in current interval [ai, bi]
      
      % do secant method
      x0 = ai;
      x1 = bi;
      
      while isEnough(func, x0, x1, tol)
        x = secantstep(func, x0, x1);
        x0 = x1;
        x1 = x;
        
        if abs(func(x1)) >= 0.5 * abs(func(x0))
          % no significant decrease
          disp('no significant decrease, 3 bisect follow');
          for k = 1:3
            mid = (x0 + x1) / 2;
            fmid = func(mid);
            
            if sign(func(x0)) ~= sign(fmid)
              x1 = mid;
            else
              x0 = mid;
            end
          end
        end
      end
      
      xs = [xs x];
    end
  end
end

function x = isEnough(func, x0, x1, tol)
  x = (abs(x1 - x0) >= tol * (1 + abs(x1)) || abs(func(x1)) >= tol);
end

function x = secantstep(func, x0, x1)
  x = x1 - ((func(x1) * (x1 - x0)) / (func(x1) - func(x0)));
end