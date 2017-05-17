%%Report Item 1
clear all;
clc;
x = [1,4,-4,-3,2,5,-6];
h = [1,2,3,4,5];
n = length(x);
C = convmtx(h,n);
imagesc(C);
title('convolution between x(n) and h(n)');
xlabel('x');
ylabel('y');
Y = x*C;
w = conv(x,h);
figure;
hold on
stem(Y,'--','r');
stem(w,'-','b');
hold off;
legend('convmtx','conv')
title('convolution between x(n) and h(n)');
xlabel('length');
ylabel('magnitude');
%% report item 2
clear all;
clc;
x = [1,4,-4,-3,2,5,-6];
n = length(x);
F = dftmtx(n);
%Y = x*A;
figure;
subplot(211);
imagesc(real(F));
title('DFT matrix F, real part');
xlabel('x');
ylabel('y');
subplot(212);
imagesc(imag(F));
title('DFT matrix F, imaginary part');
xlabel('x');
ylabel('y');
%% report item 3
clear all;
clc;
x = [1,4,-4,-3,2,5,-6];
h = [1,2,3,4,5];
n = length(x);
A = convmtx(h,n);
C = cconvmtx(h,n);
figure;
subplot(211);
imagesc(A);
title('convolution matrix');
xlabel('x');
ylabel('y');
subplot(212);
imagesc(C);
title('circular convolution matrix');
xlabel('x');
ylabel('y');

L = length(x);
M = length(h);
N = L+M-1;
h2 = [h,zeros(1,L-M)];
F = dftmtx(L);
C2 = (1/L)*F'*diag(F*h2')*F;
figure;
subplot(211);
imagesc(C);
title('circular convolution matrix');
subplot(212);
imagesc(real(C2));
title('verified circular convolution matrix');
%% report item 4
clear all;
clc;
A = [1,4,-2;3,11,5;7,7,7];
A_T = A';
[V1,D1] = eig(A*A_T)
[V2,D2] = eig(A_T*A)
[U,S,V] = svd(A)
S_T = S'
Left1 = A*A_T*U
Right1 = U*S*S_T
Left2 = A_T*A*V
Right2 = V*S_T*S
% left1 = right1; left2 = right2
%% report item 5
clc, clear all, close all;
f = dir('training_images/*.png');
faces = cell(length(f),1);
for k = 1:length(faces)
    faces{k} = imresize(rgb2gray(imread(['training_images/' f(k).name])),100,100);
end

[avgface,eigfaces] = eigenfaces(faces,10);

figure;
imagesc(avgface);
colormap('gray');
title('avergeface');

figure;
subplot(221);
imagesc(eigfaces(:,:,1));
colormap('gray');
title('eigfaces')
subplot(222);
imagesc(eigfaces(:,:,2));
colormap('gray');
title('eigfaces')
subplot(223);
imagesc(eigfaces(:,:,3));
colormap('gray');
title('eigfaces')
subplot(224);
imagesc(eigfaces(:,:,4));
colormap('gray');
title('eigefaces')

%% report item 6
face1 = imresize(rgb2gray(imread('face1.png')),100,100);
face2 = imresize(rgb2gray(imread('face2.png')),100,100);

usercoeffs = [];
for k = 1:length(faces)
    coeffs = projectface(avgface,eigfaces,faces{k});
    usercoeffs = [usercoeffs;coeffs];
end

order1 = recognizeface(avgface,eigfaces,usercoeffs,face1);
order2 = recognizeface(avgface,eigfaces,usercoeffs,face2);

figure;
subplot(221);
imagesc(face1);
colormap('gray');
title('Target Face');
subplot(222);
imagesc(faces{order1(1)});
colormap('gray');
title('match 1');
subplot(223);
imagesc(faces{order1(2)});
colormap('gray');
title('match 2');
subplot(224);
imagesc(faces{order1(3)});
colormap('gray');
title('match 3');

figure;
subplot(221);
imagesc(face2);
colormap('gray');
title('Target Face');
subplot(222);
imagesc(faces{order2(1)});
colormap('gray');
title('match 1');
subplot(223);
imagesc(faces{order2(2)});
colormap('gray');
title('match 2');
subplot(224);
imagesc(faces{order2(3)});
colormap('gray');
title('match 3');

