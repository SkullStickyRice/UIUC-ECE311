function X = myDFT2(x)
[m,n] = size(x);

for i=1:m
    X(i,:) = fft(x(i,:));
end

for j=1:n
    X(:,j) = fft(X(:,j));
end
