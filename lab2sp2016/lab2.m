%% 3
%check


%FFT algrithm computes the DFT of a sequence. 
% An FFT rapidly computes such transformations by factorizing the DFT
% matrix into a product of sparse (mostly zero) factors. As a result, it
% managee to reduce the complexity of computing the DFT from 

%% 4
clear all
load signal.mat
X = fft(x); 
N = length(X);

%w = fftshift((0:N-1)/N*2*pi);
%w(1:N/2) = w(1:N/2) - 2*pi;
%X_shift = fftshift(x);
%real_shift = real(X_shift);
%imag_shift = imag(X_shift);
%mag_shift = sqrt(real_shift.^2 + imag_shift.^2);
%phase_shift = atan(imag_shift/real_shift);
%figure ;
%stem(mag_shift);

real_X = real(X);
imag_X = imag(X);
mag_X = sqrt(real_X.^2 + imag_X.^2);
phase_X = atan(imag_X/real_X);
figure;
stem(mag_X,'-.b');
hold on;
stem(phase_X,'-r');
legend('magnitude','phase');
title('X(w)');
xlabel('w');
ylabel('X(w)');
hold off;

fs = 100; %fs = 100 HZ
omega = x * fs;

%%
X_omega = fft(omega);
real_X_omega = real(X_omega);
imag_X_omega = imag(X_omega);
mag_X_omega = sqrt(real_X_omega.^2 + imag_X_omega.^2);
phase_X_omega = atan(imag_X_omega/real_X_omega);
figure;
stem(mag_X_omega,'-.b');
hold on;
stem(phase_X_omega,'-r');
legend('magnitude','phase');
title('X(w)');
xlabel('w');
ylabel('X(w)');
hold off;
%% 5 zero-padding
clear all
load NMRSpec.mat
N = length(st) %length is already = 1024
ST = fft(st);
real_ST = real(ST);
imag_ST = imag(ST);
mag_ST = sqrt(real_ST.^2 + imag_ST.^2);
phase_ST = atan(imag_ST/real_ST);
figure 1;
stem(mag_ST);
title('zero_padding');
xlabel('w');
ylabel('magnitude');
figure 2;
stem(phase_ST);
title('zero_padding');
xlabel('w');
ylabel('phase');


ST_32 = fft(st,32)
real_32 = real(ST_32);
imag_32 = imag(ST_32);
mag_32 = sqrt(real_32.^2 + imag_32.^2);
phase_32 = atan(imag_32/real_32);
figure 3;
stem(mag_32);
title('32 points')
xlabel('w')
ylabel('magnitude')
figure 4;
stem(phase_32,'-.b');
title('32 points');
xlabel('w');
ylabel('phase');

%% 6
clear all
% rectangular window
N = 20;
w_rec = rectwin(N);
figure;
stem(w_rec);
wvtool(w_rec);
title('rectangular window');
xlabel('samples');
ylabel('Amplitude');
%492 zeros
%wz_rec = [w_rec; zeros(492,1)]
wz_rec = padarray(w_rec,512,0,'post');
%figure;
%stem(wz_rec);
dB_rec = mag2db(wz_rec);
figure;
stem(dB_rec);
title('rectangular window');
xlabel('samples');
ylabel('Magnitude(dB)');

%triangular window
w_tri = triang(N);
figure;
stem(w_tri);
wvtool(w_tri);
title('triangular window');
xlabel('samples');
ylabel('Amplitude');
wz_tri = padarray(w_tri,512,0,'post');
dB_tri = mag2db(wz_tri);
figure;
stem(dB_tri);
title('triangular window');
xlabel('samples');
ylabel('Magnitude(dB)');


%hamming window
w_ham = hamming(N);
figure;
stem(w_ham);
wvtool(w_ham);
title('hamming window');
xlabel('samples');
ylabel('Amplitude');
wz_ham = padarray(w_ham,512,0,'post');
dB_ham = mag2db(wz_ham);
figure;
stem(dB_ham);
title('hamming window');
xlabel('samples');
ylabel('Magnitude(dB)');


%hanning window
w_han = hann(N);
figure;
stem(w_han);
title('hanning window');
xlabel('samples');
ylabel('Amplitude');
wz_han = padarray(w_han,512,0,'post');
dB_han = mag2db(wz_han);
figure;
stem(dB_han);
title('hanning window');
xlabel('samples');
ylabel('Magnitude(dB)');


%Kaiser Window
beta = 0.1;
w_Kai = kaiser(N, beta);
figure;
stem(w_Kai);
title('Kaiser window');
xlabel('samples');
ylabel('Amplitude');
wz_Kai = padarray(w_Kai,512,0,'post');
dB_Kai = mag2db(wz_Kai);
figure;
stem(dB_Kai);
title('Kaiser window');
xlabel('samples');
ylabel('Magnitude(dB)');

%rectangular window smaller mainlobe width and has higher sideloop window 
%compares to triangular window.

%rectangular window has higher side lobes compares to hamming window
%%
%using diric
clear all

N_1 = 20;
w = linspace(-2*pi, 2*pi,200);
%x= exp(-1j*w*(N_1-1));
x = (exp((-1j)*w*(N_1/2)))/(exp(-1j*w/2));
x_dtft = x *diric(w,N_1);
figure;
subplot(211);
plot(w,abs(x_dtft));
title('abs of dtft for N =20');
xlabel('w');
ylabel('abs of dtft');
subplot(212);
plot(w,angle(x_dtft));
title('phase of dtft for N=20');
xlabel('w');
ylabel('phase of dtft');


N_2 = 40;
%w_2 = linspace(-2*pi, 2*pi,200);
%x_2= exp(-1j*w*(N_2-1));
x_2 = (exp(-1j*w*(N_2/2)))/(exp(-1j*w/2));
x_dtft_2 = x_2 *diric(w,N_2);
figure;
subplot(211);
plot(w,abs(x_dtft_2));
title('abs of dtft for N=40');
xlabel('w');
ylabel('abs of dtft');
subplot(212);
plot(w,angle(x_dtft_2));
title('phase of dtft for N=40');
xlabel('w');
ylabel('phase of dtft');
%%
clear all
fo = 5;
delta_t = 0.02;
N = 10;
for n = 1: N;
    x(n) = sin(2*pi*fo*n*delta_t)
end
    figure;
    subplot(211);
    plot(abs(x));
    subplot(212);
    plot(angle(x));
