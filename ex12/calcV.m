function V = calcV(f)
  Img = setFocus(f);
  C = abs(fft2(Img));
  [n, m] = size(Img);
  V = zeros(n, m);

  for k_1 = 0:n-1
    for k_2 = 0:m-1
      V(k_1 + 1, k_2 + 1) = ((n/2 - abs(k_1 - n/2))^2 + ...
        (m/2 - abs(k_2 - m/2))^2) * ...
        C(k_1 + 1, k_2 + 1);
    end
  end

  V = sum(sum(V));
end

