function problem10(d)
  % get the data
  GData = textread('provided/math_graph_G.dat');
  [~, DMathUrls] = textread('provided/math_graph_url.dat', '%d %s');

  % extract additional information from data
  npages = GData(end, 2);
  nlinks = length(GData);
  G = sparse(GData(:, 1), GData(:, 2), ones(nlinks, 1), npages, npages)';
  nlinkG = sum(G)'; % number of links from every page
  
  % some parameters for our calculation
  errlim = 10e-5;
  
  % power method
  v = ones(npages, 1) ./ npages;
  v_dash = zeros(npages, 1);
  
  while (sum(abs(v - v_dash)) / sum(abs(v)) > errlim)
    v_dash = AMult(G, v, d, npages, nlinkG);
    v = v_dash / norm(v_dash);
  end
  
  % sort by importance
  [~, SortedIndexes] = sort(v, 1, 'descend');
  DMathUrls(SortedIndexes(1:10))

  function y = AMult(G, x, d, npages, nlinks)
  % from solution... never would guessed that we should do it this way...
    y = sum(x) / npages + (1 - d) * G * (x ./ nlinks) + (d - 1)/npages * sum(x(find(nlinks)));
  end

end