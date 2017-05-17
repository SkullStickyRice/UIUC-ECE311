function X = myFFT(x)
N = length(x);
if N <= 2
    X = [x(0)+x(1),x(0)-x(1)];
end
if mod(N,2) == 0
    Xe = myFFT(x(1:2:N-1));
    Xo = myFFT(x(2:2:N));
    temp = exp(-1i*2*pi*(0:N-1)/N);
    X = [Xe,Xe]+temp.*[Xo,Xo];
else
    X = myMatrixDFT(x);
end
end

    