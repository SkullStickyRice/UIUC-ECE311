function y = sys2(x,a)
m = [1, zeros(1,63)];
for n = 1:63
      m(n+1) = a*m(n)+(x(n+1)).^2;
end
y = m;
end
