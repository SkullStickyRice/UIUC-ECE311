% Report Item 1.1
clear all;
N = 20;
N_2 =40;
n = -N:N;
n_2 = -N_2:N_2;
fc = 600;
Fs = 5000;
omegac = 2*fc/Fs;

%LPF:
hLPF = omegac/pi * sinc(omegac/pi*n);
hLPF_2 = omegac/pi * sinc(omegac/pi*n);
figure;
subplot(211);
stem(hLPF);
title('Lowpass filter impulse response');
ylabel('H(w)')
xlabel('w');
subplot(212);
plot(abs(hLPF));
title('Lowpass filter magnitude response');
ylabel('|H(w)|');
xlabel('w');

%HPF:
hHPF = 1 - hLPF;
figure;
subplot(211);
stem(hHPF);
title('Highpass filter impulse response');
ylabel('H(w)')
xlabel('w');
subplot(212);
plot(abs(hHPF));
title('Highpass filter magnitude response');
ylabel('|H(w)|');
xlabel('w');

%BPF
omega = pi/4;
hBPF = cos(omega*n) .* hLPF;
figure
stem(hBPF)

%% report item 1.2
clear all;
load impulseresponse.mat;
figure;
stem(h);
xlabel('n');
ylabel('h');
title('impulse response');
fvtool(b,a);
phasez();
%% 3, FIR
clc, clear all, close all;
N=25;
wc=pi/3;
n=-N:1:N;
x=0:1:(2*N);
d=wc/pi*sinc(wc/pi*n);

M=(N-1)/2;
D=fft(d);
G=D*exp(-1i*M*wc);
g=ifft(G);
w_ham=hamming(length(n))';
h=w_ham.*g;

figure;
stem(x,h);
xlabel('n');
ylabel('h');
title('Impulse response');
fvtool(h);
phasez(h);

%% 5, pm

close all;
f=[0.15 0.175];
a=[1,0];
rp=[1.2589 0.00316];
fs=1;
[n,fo,mo,w]=firpmord(f,a,rp,fs);
b=firpm(n,fo,mo,w);
figure;
freqz(b);
figure;
impz(b)
%% 6
clear all;
load spectrogram.mat;

[spec1, w1, shift1] = mySTDFT(x, 5, 5, 128, fs);
figure;
subplot(2,1,1);
imagesc(shift1, w1*(pi/2), abs(spec1));
xlabel('Time, s');
ylabel('Frequency,Hz,');
title('Spectrogram w/ M=5');

[spec2, w2, shift2] = mySTDFT(x, 30, 5, 128, fs);
subplot(2,1,2);
imagesc(shift2, w2*(pi/2), abs(spec2));
xlabel('Time,s');
ylabel('Frequency,Hz');
title('Spectrogram M=30');
%% Item 7.1

clear all;

[y_1, fs_1] = wavread('sound1.wav');
shift_1 = length(y_1) / fs_1;
mag_1 = abs(fftshift(fft(y_1)))
w = fftshift (2*pi*(0:length(y_1)-1)/length(y_1)); 
w(1:length(y_1)/2) = w(1:length(y_1)/2)-2*pi;

[spect_1, w_1, shift_1] = mySTDFT(y_1, 60, 10, 128, fs_1);

figure;
subplot(2,1,1);
plot(w, mag_1);
title('Magnitude Spectrum 1');

subplot(2,1,2);
imagesc(shift_1, w_1*(pi/2), abs(spect_1));
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram 1');

p_rip = 2;
s_att = -50;   
f = [0.3*(fs_1/2), 0.36*(fs_1/2)]
a = [1, 0];       
rp = [(10^(p_rip/20)-1)/(10^(p_rip/20)+1)  10^(s_att/20)];
[n,fo,m0,w] = firpmord(f,a,rp,fs_1);
b_1 = firpm(n,fo,m0,w);

mag_filt1 = fftshift(fft(filter(b_1,1,y_1)));
w = fftshift((0:length(y_1)-1)/length(y_1)*(2*pi));
w(1:length(y_1)/2) = w(1:length(y_1)/2)-2*pi;

[spect_2, w_2, shift_2] = mySTDFT(y_1, 60, 10, 128, fs_1);

figure;
subplot(2,1,1);
plot(w, abs(mag_filt1));
title('Magnitude Spectrum 1 (Filtered)');

subplot(2,1,2);
imagesc(shift_2, w_2*(pi/2), abs(spect_2));
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram 1 (Filtered)');

soundsc(y_1, fs_1);
soundsc(filter(b_1,1,y_1), fs_1);

%%  7.2

clear all;
[y_2, fs_2] = wavread('sound2.wav');
mag_2 = abs(fftshift(fft(y_2)))
phase_2 = angle(fftshift(fft(y_2)))
w = fftshift (2*pi*(0:length(y_2)-1)/length(y_2)); 
w(1:length(y_2)/2) = w(1:length(y_2)/2)-2*pi;

[spect_1, w_1, shift_1] = mySTDFT(y_2, 60, 10, 128, fs_2);

figure;
subplot(2,1,1);
plot(w, mag_2);
title('Magnitude Spectrum 2');

subplot(2,1,2);
imagesc(shift_1, w_1*(pi/2), abs(spect_1));
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram 2');

p_rip = 2;
s_att = -50;   
f = [0.3*fs_2/2, 0.36*fs_2/2]
a = [1, 0];       
rp = [(10^(p_rip/20)-1)/(10^(p_rip/20)+1)  10^(s_att/20)];
[n,fo,m0,w] = firpmord(f,a,rp,fs_2);
b_2 = firpm(n,fo,m0,w);

magfilt_2 = fftshift(fft(filter(b_2,1,y_2)));
w = fftshift((0:length(y_2)-1)/length(y_2)*2*pi);
w(1:length(y_2)/2) = w(1:length(y_2)/2)-2*pi;
[spect_2, w_2, shift_2] = mySTDFT(y_2, 60, 10, 128, fs_2);

figure;
subplot(2,1,1)
plot(w, abs(magfilt_2));
title('Magnitude Spectrum 2 (Filtered)');

subplot(2,1,2)
imagesc(shift_2, w_2*(pi/2), abs(spect_2));
xlabel('Time(s)');
ylabel('Frequency(Hz)');
title('Spectrogram 2 (Filtered)');

soundsc(y_2, fs_2);
soundsc(filter(b_2,1,y_2), fs_2);

