function face = constructface(avgface,eigfaces,coeffs)  
    face = avgface;    
    K = size(eigfaces,3);
    for k = 1:K
        face = face + coeffs(k)*eigfaces(:,:,k);
    end    
end
