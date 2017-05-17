function y = myDFTConv(x,h)
n = length(x);
m=length(h);
L = n+m-1;
y = ifft(fft(x,L).*fft(h,L));
end