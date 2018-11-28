%Abstract mandlebrot calculator. Generates different portions of the set
%based on the given values
function res = deeper(x,y)
    c = x + y;
    z = 0;
    n = 100;
    for i = 1:n
        if (abs(z) <= 16) && n <= 100
            z = z*z+c;
        else
            break
        end
    end
    if i == n
        res = 1;
    else
        normal = interp1([0,n],[0,1],i);
        res = normal;
    end
end