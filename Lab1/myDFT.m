function X = myDFT(x)
N = length(x);
X_i = 0;
X = 0;
for k = 1:N;
    for n = 1:N;
        X_i(n) = x(n)*exp(-j*2*pi*(k-1)*(n-1)/N);
    end
    X(k) = sum(X_i);
end
end

% answer:X =

%       1.0000             8.8262 + 1.5388i  -6.8262 - 0.3633i  -6.8262 + 0.3633i   8.8262 - 1.5388i

