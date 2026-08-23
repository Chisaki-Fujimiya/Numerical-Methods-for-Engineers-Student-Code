function [root, iterations] = falseposition(f, xl, xu, es, maxIter)

    xr_old = xl;

    fprintf('Iter        xl          xu          xr        f(xl)        f(xu)        f(xr)       Ea\n');
    fprintf('--------------------------------------------------------------------------------------------\n');

    for i = 1:maxIter

        xr = xu - (f(xu) * (xl - xu)) / (f(xl) - f(xu));

        fxl = f(xl);
        fxu = f(xu);
        fxr = f(xr);

        ea = abs((xr - xr_old) / xr) * 100;

        fprintf('%2d   %10.6f  %10.6f  %10.6f  %10.6f  %10.6f  %10.6f  %10.6f%%\n', ...
            i, xl, xu, xr, fxl, fxu, fxr, ea);

        if ea < es
            break;
        end

        if fxl * fxr < 0
            xu = xr;
        else
            xl = xr;
        end

        xr_old = xr;
    end

    root = xr;
    iterations = i;
end