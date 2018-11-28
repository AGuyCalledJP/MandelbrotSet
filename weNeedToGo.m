%give it some depth
%Param int z -> Determine how deep the zoom is (0-3)
function weNeedToGo(z)
    %real number line
    if z == 0 
        real = -1.4:.01:.6;
        fake = -1:.01:1;    
    elseif z == 1
        real = -1:.001:-.6;
        fake = -.5:.001:-.1;    
    elseif z == 2
        real = -.7:.0001:-.6;
        fake = .4:.0001:.5;
    elseif z == 3
        real = -.68:.00001:-.64;
        fake = .44:.00001:.48;
    end

    %psudo complex line
    y = fake .* -1;

    [X2,Y2] = meshgrid(fake, y);

    %imaginary number line
    imaginary = nan(1,length(y));
    for j = 1:length(y)
        fake = single(y(j))*1i;
        imaginary(j) = fake;
    end
    %create the complex plane
    [X,Y] = meshgrid(real, imaginary);
    size = length(X);

    %resulting points to plot
    M = zeros(size,size);

    for i = 1:length(X)
        for j = 1:length(Y)
            M(i,j) = deeper(X(i,j),Y(i,j));
        end
    end
    M;

    mycolors = [ 0.996, 0.988, 0.976; 0 0 0; 0.501, 0.019, 0.023 ];

    figure
    surf(X,Y2,M)
    colormap(mycolors);
end