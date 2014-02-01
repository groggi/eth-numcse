nruns = 3;
res1 = [];
res2 = [];
ns = 2.^(5:12);
for n = ns
  % params
  alpha = rand(1);
  u = rand(n, 1);
  v = rand(n, 1);
  x = rand(n, 1);
  % timevar
  time1 = realmax;
  time2 = realmax;
  for k=1:nruns
    % algo 1
    tic;
        A1 = (eye(n) + alpha * u * v') * x;
    time1 = min(toc,time1);
    % algo 2
    tic;
        A2 = x + alpha * u * (v' * x);
    time2 = min(toc,time2);
  end;
  res1 = [res1; time1];
  res2 = [res2; time2];
end
figure('name','timings arrowmatvec');
c11 = sum(res1)/sum(ns.^1);
c12 = sum(res2)/sum(ns.^2);
loglog(ns, res1, 'r+'); hold on;
loglog(ns, res2, 'g+'); hold on;
xlabel('{\bf vector size n}','fontsize',14);
ylabel('{\bf time[s]}','fontsize',14);
title('{\bf timings for 2)}','fontsize',14);
legend('first algo', 'second algo', 'location','best');
%print -depsc2 '../PICTURES/arrowmatvectiming.eps';
%print -djpeg95 '../PICTURES/arrowmatvectiming.jpg';
