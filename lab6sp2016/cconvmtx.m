function C=cconvmtx(h,n)
h = h(:);
N_h = length(h);
N_c = n+N_h-1;
H = convmtx(h,n);
C = H(1:n,1:n);
C(1:(N_h-1),1:n) = C(1:(N_h-1),1:n)+H((n+1):N_c,1:n);
end
