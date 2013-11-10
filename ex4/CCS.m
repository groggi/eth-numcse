function [val, row_ind, col_ptr] = CCS(A)
  [row_ind, col, val] = find(A);
  
  lastval = realmin;
  col_ptr = [];
  for ind = 1:size(col, 1)
    if lastval ~= col(ind)
      col_ptr = [col_ptr; ind];
    end
    
    lastval = col(ind);
  end
  
  col_ptr = [col_ptr; ind + 1];
end