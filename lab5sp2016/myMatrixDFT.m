function X = myMatrixDFT(x)
N = length(x);
X_i = 0;
X = 0;
for k = 1:N;
    for n = 1:N;
        Z = exp(-j*2*pi*(k-1)*(n-1)/N);
        X_i(n) = x(n)*Z;
    end
    X(k) = sum(X_i);
end
end
