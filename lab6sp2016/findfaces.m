function [x,y,s,score,temp] = findfaces(avgface,eigfaces,image,n,scales)
    numscales = length(scales);
    [iM,iN] = size(image);
    [M,N,K] = size(eigfaces);
    score = cell(numscales,1);
    numscore = 0;
    for p = 1:numscales
        % Determine scaled dimensions.
        sM = ceil(M*scales(p));
        sN = ceil(N*scales(p));
        
        % Create scaled eigenfaces/avgface.
        avgface_ = my_imresize(avgface,sM,sN);
        eigfaces_ = zeros(sM,sN,K);
        for k = 1:K
            eigfaces_(:,:,k) = my_imresize(eigfaces(:,:,k),sM,sN);
        end
        
        % Loop over all pixels and create MSE matrix.
        numColImages = iN - sN + 1;
        numRowImages = iM - sM + 1;
        score{p} = zeros(numRowImages,numColImages);
        for i = 1:numRowImages
            for j = 1:numColImages
                temp = image(i:i+sM-1,j:j+sN-1);
                variance=var(reshape(temp - sum(sum(temp))/sM/sN,1,sM*sN));
                scale = norm(temp - avgface_)/variance;
%                scale = 1;
                score{p}(i,j) = ...
                    isface(avgface_,eigfaces_,temp)*scale;                
            end
        end        
        score{p} = score{p}/max(max(abs(score{p})));
        numscore = numscore + numRowImages*numColImages;
    end
    
    % Gather all MSE.
    temp = zeros(numscore,5);
    index = 1;
    for p = 1:numscales
        [numRowImages,numColImages] = size(score{p});
        sM = ceil(M*scales(p));
        sN = ceil(N*scales(p));
        for i = 1:numRowImages
            for j = 1:numColImages
                temp(index,:) = [score{p}(i,j),i,j,sN,sM];
                index = index + 1;
            end
        end           
    end
    
    % Sort in from least MSE to greatest MSE and set MSE threshold.    
    temp = sortrows(temp,1);
    temp = temp((temp(:,1) > 0.06) & (temp(:,1) < 1),:);
    y = temp(1:n,2);
    x = temp(1:n,3);
    s = temp(1:n,4:5);    
end