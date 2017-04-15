% Kmeans algorithm.
% X = Xtrain
% k = number of clusters to form
% T = number of iterations
function [M] = kmeans(X, k, T)
    nSamples = size(X,1);
    nFtrs = size(X,2);
    
    % intialize centroids
    centroids = zeros(k, nFtrs);
    randomCentroids = randperm(size(X,1));
    centroids = X(randomCentroids(1:k), :);
    
    for i=1:T
        % find closest centroid
        closestCentroidID = zeros(nSamples,1);
        for j=1:nSamples
            kth = 1;
            minDist = sum(X(j,:) - centroids(kth, :)).^2;
            for m = 2:k
                dist = sum(X(j,:) - centroids(m, :)).^2;
                if(dist < minDist)
                    minDist = dist;
                    kth = m;
                end
            end
            closestCentroidID(j) = kth;
        end
        
        % recompute centroids
        newCentroids = zeros(k, nFtrs);
        for j=1:k
            xj = X(closestCentroidID==j, :);
            count = size(xj, 1);
            newCentroids(j,:) = (1/count) * sum(xj);    
        end
        centroids = newCentroids;
            
    end
    M = centroids;
end