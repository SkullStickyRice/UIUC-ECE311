%lab 5 check
clear all;
load signal.mat
X = myFFT(x);
Y = fft(x);
figure;
subplot(211);
plot(abs(fftshift(X)));
xlabel('w');
ylabel('magnitude');
title('fft using myFFT functoin');
subplot(212);
plot(abs(fftshift(Y)));
xlabel('w');
ylabel('magnitude');
title('fft using buildin fft funciton');