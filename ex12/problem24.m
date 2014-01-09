ps = 1:13;
sizes = 2.^ps;

t_matvec = zeros(length(sizes), 1);
t_cconv = zeros(length(sizes), 1);
t_fft = zeros(length(sizes), 1);

tries = 10;

for i = 1:length(sizes)
  n = sizes(i);
  
  for t = 1:tries
    c = rand(n, 1);
    x = rand(n, 1);

    %
    % matrix multiplication
    %
    C_matvec = gallery('circul', c)';

    tic;
    y_matvec = C_matvec * x;
    t_matvec(i) = t_matvec(i) + toc;

    %
    % problem 24a
    %
    tic;
    y_cconv = cconv(c, x, length(c));
    t_cconv(i) = t_cconv(i) + toc;

    %
    % problem 24b
    %
    tic;
    y_fft = ifft(fft(c) .* fft(x));
    t_fft(i) = t_fft(i) + toc;
  end
end

hold on;
loglog(2.^ps, t_matvec ./ tries, 'r+-');
loglog(2.^ps, t_cconv ./ tries, 'g+-');
loglog(2.^ps, t_fft ./ tries, 'b+-');