function [roots, iteration] = openmethod(f, xi, e, maxIter)
    
    fprintf('Iter        x          x(i+1)        Ea\n');
    fprintf('---------------------------------------\n');
    for i = 1:maxIter
    
        fm = f(xi);
        
        if i > 1 
            es = abs( ((fm - xi)/fm) * 100);
        else
            es = 0;
        end
        
        fprintf('%2d  %10.4f  %10.4f  %10.4f%%\n', i, xi, fm, es);
 
        if i > 1 && es <= e
            break;
        end
            
        xi = fm;

    end

    roots = fm;
    iteration = i;
end