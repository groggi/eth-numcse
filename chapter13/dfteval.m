function ys = dfteval(a0, a, b, xs)
  l = max(size(a)); % don't care if a is row or column vector
  
  % page 389:
  % 0.5 * (a_0 + a_l * cos(l * x)) + sum ... = 0.5 * a_0 + 0.5 * a_l * cos(l*x) + sum ...
  %                                           |---------|
  % we only calculate the first term, before the plus
  ys = 0.5 * a0 * ones(size(xs));
  
  for k = 1:l-1
    % add the sum term
    ys = ys + a(k) * cos(k*xs) + b(k) * sin(k*xs);
  end
  
  % add the still missing 0.5 * a_l * cos(l*x) part
  ys = ys + 0.5 * a(l) * cos(l * xs);
end

