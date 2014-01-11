function df = DF(x)
  x = x(:);
  n = length(x);
  
  df = zeros(n^2, n);
  
  for i = 1:n
    for j = 1:n
      for k = 1:n
        val = 0;
        
        if k == i && k == j
          val = -2 * x(i);
        elseif k == i
          val = -x(j);
        elseif k == j
          val = -x(i);
        end
        
        df(i + (j-1) * n, k) = val;
      end
    end
  end
  
%   df = reshape(df, n^3, 1);
end

