function order = recognizeface(avgface,eigfaces,usercoeffs,face)
    numface = size(usercoeffs,1);
    usermse = zeros(numface,1);
    for i = 1:numface
        face_ = constructface(avgface,eigfaces,usercoeffs(i,:));  
        usermse(i) = comparefaces(avgface,eigfaces,face,face_);
    end
    [temp,order] = sort(usermse);
end