function [avgface,eigface,V] = eigenfaces(faces,K)
    numface = length(faces);
    avgface = zeros(size(faces{1}));
    [M,N] = size(avgface);
    facematrix = zeros(numface,M*N);
    for i = 1:numface
        avgface = avgface + faces{i};
        facematrix(i,:) = reshape(faces{i},1,M*N);
    end
    
    avgface = avgface / numface;    
    avgface_ = reshape(avgface,1,M*N);
    
    for i = 1:numface
        facematrix(i,:) = reshape(faces{i},1,M*N) - avgface_;
    end
    
    R = facematrix.'*facematrix;
    [U,S,V] = svds(R,K);
%     [U,S,V] = svd(R);
    eigface = zeros(M,N,K);

    for i = 1:K
        temp = reshape(V(:,i),M,N);
%         eigface(:,:,i) = temp / norm(temp); 
        eigface(:,:,i) = temp; 
    end
    
    figure;
    plot(diag(S));
    title('Eigenfaces singular values','fontsize',12);
end