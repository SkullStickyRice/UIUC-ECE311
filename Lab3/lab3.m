%report item 1
clear all;
x = [-1,2,1,5,4];
h = [1,2,3,2];
y = conv(x,h);
figure;
subplot(211);
stem(y);
title('convolution');
xlabel('n');
ylabel('magnitude');

y_1=myDFTConv(x,h);
subplot(212);
stem(y_1);
title('myDFTConv');
xlabel('n');
ylabel('magnitude');
%% diff,1.2
clear all;
x = [1,zeros(1,63)];
a=2;
y=sys1(x,a);
figure;
stem(y);
title('impulse response of difference equation');
xlabel('n');
ylabel('magnitude');
%% 2
clear all;
x=[1,zeros(1,63)];
a=2;
y=sys2(x,a);
figure;
subplot(211);
stem(y);
title('impulse response of difference  equation (a=2)');
xlabel('n');
ylabel('magnitude');

a_1=0.5;
y_1=sys2(x,a_1);
subplot(212);
stem(y_1);
title('impulse response of difference equation (a=0.5)');
xlabel('n');
ylabel('magnitude');
%% z_1
clear all;
b = [2,0,5,4,0,0,-3];
a = [1];
S = tf(b,a);
N = 20;
figure;
subplot(121);
pzplot(S);
zplane(b,a);
title('Pole-Zero Map');
subplot(122);
impz(b,a,N);
%% z_2
clear all;
b = [3,2,0,-2];
a = [1];
S = tf(b,a);
N = 20;
figure;
subplot(121);
pzplot(S);
zplane(b,a);
title('Pole-Zero Map');
subplot(122);
impz(b,a,N);
%% z_3
clear all;
b = [0,0,1,0,0,1,-2];
a = [12,1,0,4];
S = tf(b,a);
N = 20;
figure;
subplot(121);
pzplot(S);
zplane(b,a);
title('Pole-Zero Map');
subplot(122);
impz(b,a,N);
%% z_4
clear all;
b = [0,1];
a = [1,-1.628,1];
S = tf(b,1);
N=35;
figure;
subplot(121);
pzplot(S);
zplane(b,a);
title('Pole-Zero Map');
subplot(122);
impz(b,a,N);







