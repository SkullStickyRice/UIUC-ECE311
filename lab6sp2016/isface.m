function mse = isface(avgface,eigfaces,face)
   [M,N] = size(face);
   avgface_ = sum(sum(face))/M/N;
   coeffs = projectface(avgface_,eigfaces,face);
   face_ = constructface(avgface,eigfaces,coeffs);
   mse = sum(sum((face_ - face).^2))/M/N;
end