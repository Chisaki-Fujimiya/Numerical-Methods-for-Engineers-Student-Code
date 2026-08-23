format long;
clc

f = @(x) sqrt(sin(x));
[root, iterations] = openmethod(f, 0.5, 2, 100);

