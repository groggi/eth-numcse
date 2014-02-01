function plotFFTSamples

    % read original image
    orig_image = double(imread('provided/eth.pbm'));
    col = [0:1/254:1]'*[1,1,1];
    
    f = 0:3;
    
    % create plots
    for i = 1:length(f)
        subplot(2,2,i);
        
        modified_image = setFocus(f(i));
        fft2_mod_image = abs(fft2(modified_image)); % war irritiert, hab abs vergessen -> abs aus Musterlösung
        image(fft2_mod_image);
        colorbar(); % aus der Musterlösung
        
        axis('off');
        axis('equal');
        
    end
end

