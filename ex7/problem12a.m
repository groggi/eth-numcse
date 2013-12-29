% load images
imgA = load('mandrill');
imgB = load('durer');

% set basic settings
colormap('gray');

% show original images
subplot(7, 2, 1);
image(imgA.X);
title('original A');

subplot(7, 2, 2);
image(imgB.X);
title('original B');

% use SVD to compress image
pows = 1:6;
rs = 2 .^ pows;
nextsubplot = 3;

for r = rs
  % SVD of first image
  [U_A, S_A, V_A] = svds(imgA.X, r);
  subplot(7, 2, nextsubplot);
  image(U_A * S_A * V_A');
  
  nextsubplot = nextsubplot + 1;
  
  % SVD of second image
  [U_B, S_B, V_B] = svds(imgB.X, r);
  subplot(7, 2, nextsubplot);
  image(U_B * S_B * V_B');
  
  nextsubplot = nextsubplot + 1;
end