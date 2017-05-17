%% report teim1
clear all;
clc;

[y,fs] = wavread('audioclip.wav');
figure;
plot(mag2db(abs(fftshift(fft(y)))));
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
title('Original Signal');

%upsample
yup = upsample(y,2);
figure;
plot(mag2db(abs(fftshift(fft(yup)))));
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
title('upsample before apply LP filter');

%upsample with LP filter
fft_yup = fft(yup);
fft_yup(6*10^5:8*10^5,1) = 0;
fft_yup(6*10^5:8*10^5,2) = 0;
lp_yup = ifft(fft_yup);
figure;
plot(mag2db(abs(fftshift(fft(lp_yup)))));
xlabel('Frequency(Hz)');
ylabel('Magenitude(dB)');
title('upsample with LP filter');

%downsample
ydown = downsample(lp_yup,3);
figure;
plot(mag2db(abs(fftshift(fft(ydown)))));
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
title('downsampel with LP filter');

%play sound
%sound(y,fs);
%sound(yup,fs);
sound(ydown,fs);
%% Report item2
%myDFT2
clear all;
clc;
sample = [1 2 3;4 5 6;7 8 9];
test = fft2(sample)
y = myDFT2(sample)
%meshgrid
[m,n]=meshgrid(0:99,0:99);
N = length(n);
M = length(m);
x = fftshift((0:N-1)/2*pi*N);
x(1:N/2) = x(1:N/2)-2*pi;
y = fftshift((0:N-1)/2*pi*N);
y(1:M/2) = x(1:M/2)-2*pi;

figure;
subplot(211);
imagesc(cos(pi/4*n));
xlabel('kx');
ylabel('ky');
title('(kx,ky) = (\pi/4,0)');
dft1 = fftshift(fft2(cos(pi/4*n)));
subplot(212);
imagesc(x,y,abs(dft1));
xlabel('kx');
ylabel('ky');
title('2D DFT for (kx,ky) = (\pi/4,0)');

figure;
subplot(211);
imagesc(cos(pi/4*m));
xlabel('kx');
ylabel('ky');
title('(kx,ky) = (0,\pi/4)');
dft2 = fftshift(fft2(cos(pi/4*m)));
subplot(212);
imagesc(x,y,abs(dft2));
xlabel('kx');
ylabel('ky');
title('2D DFT for (kx,ky) = (0,\pi/4)');

figure;
subplot(211);
imagesc(cos(pi/4*m+pi/4*n));
xlabel('kx');
ylabel('ky');
title('(kx,ky) = (\pi/4,\pi/4)');
dft3 = fftshift(fft2(cos(pi/4*m+pi/4*n)));
subplot(212);
imagesc(x,y,abs(dft3));
xlabel('kx');
ylabel('ky');
title('2D DFT for (kx,ky) = (\pi/4,\pi/4)');

figure;
subplot(211);
imagesc(cos(-pi/4*m+pi/4*n));
xlabel('kx');
ylabel('ky');
title('(kx,ky) = (\pi/4,-\pi/4)');
dft4 = fftshift(fft2(cos(-pi/4*m+pi/4*n)));
subplot(212);
imagesc(x,y,abs(dft4));
xlabel('kx');
ylabel('ky');
title('SD DFT for (kx,ky) = (\pi/4,-\pi/4)');
%% Report item3
clear all;
clc;
imag1 = imread('image1.jpg');
h = [1/8 1/16 1/8;1/16 1/4 1/16;1/8 1/16 1/8];
y = conv2(imag1,h);
figure;
imagesc(y);
xlabel('x');
ylabel('y');
title('image1');
%% Report item4
clear all;
clc;
imag2 = imread('image2.jpg');
h = [-1 -1 -1;-1 8 -1;-1 -1 -1];
y = conv2(imag2,h);
figure;
imagesc(y);
colormap('gray');
xlabel('x');
ylabel('y');
title('image2');
















