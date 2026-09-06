function [root, iteration] = bisectionmethod(f, xl, xu, es, maxIter)

    fprintf('Iter        xl          xu        xm        f(xl)f(xu)       Ea\n');
    fprintf('----------------------------------------------------------------\n');
    
    xm_old = 0;
    
    for i = 1.0:maxIter 
        xm = (xl + xu) / 2;
    
        if i > 1
            e = abs((xm - xm_old) / xm) * 100;
        else
            e = 0;
        end
    
        fm = (f(xm)) * (f(xl));
    
        if fm < 0 
            xu = xm;
        else
            xl = xm;
        end
    
        xm_old = xm;
    
        fprintf('%2d   %10.6f  %10.6f  %10.6f  %10.6f  %10.6f%%\n', ...
            i, xl, xu, xm, fm, e);
    
        if i > 1 && e <= es
            break;
        end
    end
    
    root = xm;
    iteration = i;

end