function halfcircle()
  a = 1;
  small = 0;
  big = 1;
  
  bFunc = @(x) 8/3 - 4/3 * x;
  
  points = [-1 -1 0 1 1;0 a bFunc(a) a 0];
  len = bezLength(points);
  
  while(abs(len - pi) > 10e-5)
    a = (big + small)/2;
    
    points = [-1 -1 0 1 1;0 a bFunc(a) a 0];
    len = bezLength(points);
    display(len)
    
    if len < pi
      small = a;
    else
      big = a;
    end
  end
  
  display(len);
  points = [-1 -1 0 1 1;0 a bFunc(a) a 0];
  plot_bezcurv(points);
  
end

