function mse = comparefaces(avgface,eigfaces,face1,face2)
    coeffs1 = projectface(avgface,eigfaces,face1);
    coeffs2 = projectface(avgface,eigfaces,face2);
    N = length(coeffs1);
    mse = sum((coeffs1 - coeffs2).^2)/N;
end