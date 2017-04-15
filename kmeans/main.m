% initialize dataset here.
load('mnist.mat');
Xtr = Xtr'; 
ytr = ytr';
Xte = Xte';
yte = yte';

nSamples = size(Xtr,1);
nFtrs = size(Xtr,2);
max_iterations = 15;
    
% Testing for different values of k stored in KVec.
KVec = [2, 4, 6, 8, 10, 12, 14];
totSumVec = [];
purityVec = [];
for K=1:size(KVec,2)
    disp(KVec(K));
    [centroids] = kmeans(Xtr, KVec(K), max_iterations);

    % total within group sum of squares
    % find closest centroid
    closestCentroidID = zeros(nSamples,1);
    totSum = 0;
    for j=1:nSamples
        kth = 1;
        minDist = sum(Xtr(j,:) - centroids(kth, :)).^2;
        for m = 2:KVec(K)
            dist = sum(Xtr(j,:) - centroids(m, :)).^2;
            if(dist < minDist)
                minDist = dist;
                kth = m;
            end
        end
        totSum = totSum + minDist;
        totSumVec(K) = totSum;
        closestCentroidID(j) = kth;
    end   
    
    % Purity calculation
    purity = 0;
    for j=1:KVec(K)
        yj = ytr(closestCentroidID==j, :);
        enc.val = unique(ytr);
        enc.rep = histc(yj,enc.val);
        enc.rep = sort(enc.rep, 'descend');
        max = enc.rep(1);
        purity = purity + max;
    end
    disp(purity/nSamples);
    purityVec(K) = purity/nSamples;    
end

% 1.0e+07 *
% 2.4614    0.8044    0.3957    0.2314    0.1756    0.1170    0.1188
disp(totSumVec);

% 0.1903    0.2272    0.2253    0.2299    0.2284    0.2314    0.2311
disp(purityVec);

plot(KVec, totSumVec);
title('Total within group sum of squares for k = 2, k = 4, k = 6, k = 8, k = 10, k = 12, and k = 14.');
xlabel('K');
ylabel('Total within group sum of squares');

% cluster purity as a measure of success
% maximum number of actual labels within a cluster given by kmeans
plot(KVec, purityVec);
title('Purity for k = 2, k = 4, k = 6, k = 8, k = 10, k = 12, and k = 14.');
xlabel('K');
ylabel('Purity');