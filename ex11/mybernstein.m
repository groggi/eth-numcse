function B = mybernstein(deg, t)
  t = t(:)';
  
%   % using basic version on book page 127
%   B1 = zeros(deg + 1, length(t));
%   for ti = 1:deg
%     for i = 0:deg
%       B1(i+1, ti) = nchoosek(deg, i) * (1 - t(ti))^(deg - i) * t(ti)^i;
%     end
%   end
%   
%   display(B1);
  
  % remove inner loop
  is = 0:deg;
  nk = factorial(deg) ./ (factorial(is) .* factorial(deg - is));
  
  B2 = zeros(deg + 1, length(t));
  for ti = 1:length(t)
    B2(:, ti) = nk .* (1 - t(ti)).^(deg - is) .* t(ti).^is;
  end
  
  B = B2;
  
%   display(B2);
  
end
