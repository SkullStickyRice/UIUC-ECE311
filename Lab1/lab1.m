clear all
%% 3
clear all
linspace(0,1,12)% linspace(x1,x2,n), the space between is (x2-x1)/(n-1);
%% 5.1
clear all
x = linspace(0,5,100);
y = (x.^2).*log(x).*sin(x);
figure;
plot(x,y);
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
title('linspace practice','fontsize',14);
%% 5.2
clear all
x = 0:0.2:5;
y = (x.^2).*exp(sqrt(x));
g = 3*sqrt(x) + sin(8*pi*x);

figure;
subplot(211);
plot(x,y);
title('f(x) = x^2*e^(x^(1/2))');
xlabel('x');
ylabel('y');

subplot(212);
plot(x,g);
title('g(x) = 3*(x^(1/2)) + sin(8*pi*x)')
xlabel('x');
ylabel('g');


figure;
subplot(211);
stem(x,y);
title('f(x) = x^2*e^(x^(1/2)) using stem');
xlabel('x');
ylabel('y');

subplot(212);
stem(x,g);
title('g(x) = 3*(x^(1/2)) + sin(8*pi*x) using stem');
xlabel('x');
ylabel('g');

%% 6
clear all
x = [1,3,-4,-3,4];
X = myDFT(x);
real_X = real(X);
figure;
stem(real_X,'-.r');
hold on;
imag_X = imag(X);
stem(imag_X,'-b');
legend('realX','imagX');
title('myDFT');
xlabel('x');
ylabel('X');
hold off;
%% 7
clear all
x = linspace(-5,5,300);
y = linspace(-4,4,400);
[xx,yy] = meshgrid(x,y);
f = sinc(sqrt(xx.^2 + yy.^2));
figure;
imagesc(x,y,mag2db(abs(f)));
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
title('f = sinc(sqrt(xx.^2 + yy.^2))');
f = sinc(xx).*sinc(yy);
figure;
imagesc(x,y,mag2db(abs(f)));
xlabel('x');
ylabel('y');
title('f = sinc(xx).*sinc(yy)');
%% 8.1
clear all
load speechsig.mat 
Fs = 9000;
soundsc(x,Fs); %default 8192 hertz, frequecny of human hearing is from 20 Hz to 20 khz
%% 8.2
clear all
load clown
figure;
imagesc(X);
title('clown');
xlabel('x');
ylabel('y');
colormap(map);
%
figure;
subplot(211);
plot(X(17,:));
title('17th row');
xlabel('x');
ylabel('y');
subplot(212);
plot(X(:,49));
title('49th column');
xlabel('x');
ylabel('y');
%
figure;
transposeX = X.';
imagesc(transposeX);
title('transposed clown');
xlabel('transposed x');
ylabel('transposed y');
colormap(map);