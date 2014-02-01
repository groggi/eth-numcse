function y = toepm(c, r, x)
% Berechnet y = T * x, wobei T die Toeplitz-Matrix ist, die durch c und r
% definiert wird.

C_col = [c; r(length(r) : -1 : 2)]; % Erste Spalte von C
resized_x = [x; zeros(length(r) - 1, 1)]; % x vergrössern mit 0 Elementen.
                                          % Das Resultat steht dann einfach in den ersten length(x) Elementen von y.
         
fft_c = fft(C_col);
fft_x = fft(resized_x);
whole_y = ifft(fft_c .* fft_x);

y = whole_y(1:length(x)); % wie oben geschrieben: nur die ersten length(x) Elemente sind relevant, der rest ist "Müll"
end
