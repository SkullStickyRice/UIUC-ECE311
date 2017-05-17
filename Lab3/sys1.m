function y = sys1(x,a)
m = [0.3,zeros(1,63)];
for n = 1:63
    m(n+1) = a*m(n)+0.3*x(n+1)-2*x(n);
end
y=m;
end
