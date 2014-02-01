function plotSamples()
    % read original image
    orig_image = double(imread('provided/eth.pbm'));
    col = [0:1/254:1]'*[1,1,1];
    
    % f = 0
    subplot(2,2,1);
    image(setFocus(0));
    colormap(col);
    title('f = 0');
    axis('off');
    axis('equal');
    
    % f = 1
    subplot(2,2,2);
    image(setFocus(0));
    colormap(col);
    title('f = 1');
    axis('off');
    axis('equal');
    
    % f = 2
    subplot(2,2,3);
    image(setFocus(0));
    colormap(col);
    title('f = 2');
    axis('off');
    axis('equal');
    
    % f = 3
    subplot(2,2,4);
    image(setFocus(0));
    colormap(col);
    title('f = 3');
    axis('off');
    axis('equal');
end

