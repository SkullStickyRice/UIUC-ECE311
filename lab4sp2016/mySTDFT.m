function[Z, R, time_shift] = mySTDFT(x, M, D, P, fs)

    N = length(x);
    a = ceil(P/2);
    b = floor((N-M)/D);
    
    Z = zeros(a, b+1);
    time_shift= zeros(1, b+1);

    for n = 0:b
        time_shift(n+1) = (n*D)/fs;
        
        temp_mat = fft(x(1+n*D:M+n*D),P);
        Z(:,n+1) = temp_mat(1:a);
    end
    
    R = (0:a)*2*pi/P*fs;

end