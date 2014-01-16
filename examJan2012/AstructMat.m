function A = AstructMat(a)
  n = length(a);
  h = 1:n;
  
  A = zeros(n);
  for i = 1:n
    A(i, i:end) = h(1:end-(i-1)) .* a(i);
  end
end

