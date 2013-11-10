sizes = 2 .^ (5:1:12);
iterNr = 1;
runs = 5;

slowTimes = zeros(size(sizes, 1));
fastTimes = zeros(size(sizes, 1));

% iterate over the vector sizes
for n = sizes
  slowT = realmax;
  fastT = realmax;
  
  for r = runs
    % prepare vectors and matrices
    I = eye(n);
    u = rand(n, 1);
    v = rand(n, 1);
    x = rand(n, 1);
    a = rand();

    % the O(n^2) way
    tic;
      result1 = (I + a * u * v') * x;
    slowT = min(toc, slowT);

    % the O(n) way
    tic;
      result2 = x + a * u * (v' * x);
    fastT = min(toc, fastT);
    
  end
  
  slowTimes(iterNr) = slowT;
  fastTimes(iterNr) = fastT;
  
  iterNr = iterNr + 1;
  
end

% plot the measured times
v = sum(slowTimes(1, :)) / sum(sizes .^ 2);
t = sum(fastTimes(1, :)) / sum(sizes);
loglog(sizes, slowTimes, 'r*', sizes, fastTimes, 'go', sizes, v * sizes .^ 2, 'r-', sizes, t * sizes, 'g-');
legend('Algo mit O(n^2)', 'Algo mit O(n)', 'O(n^2)', 'O(n)');

