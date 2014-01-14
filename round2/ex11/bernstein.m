function B = bernstein(n, t)
  t = t(:);
  B = zeros(length(t), n + 1);
  for i = 0:n
    B(:, i + 1) = nchoosek(n, i) .* (1 - t).^(n - i) .* t.^i;
  end
end