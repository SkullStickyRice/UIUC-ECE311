function coeffs = projectface(avgface,eigfaces,newface)
    face = newface - avgface;    
    K = size(eigfaces,3);
    coeffs = zeros(1,K);
    for k = 1:K
        coeffs(k) = sum(sum(face.*eigfaces(:,:,k)));
    end
end