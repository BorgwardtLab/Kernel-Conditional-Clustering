function clustering = kkmeans(X, k)
    K = rbf_kernel(X, MedianDist(X));
    [H, ~] = eigs(K, k, 'la');
    H_normalized = H ./ repmat(sqrt(sum(H.^2, 2)), 1, k);

    stream = RandStream.getGlobalStream;
    reset(stream);
    clustering = kmeans(H_normalized, k, 'MaxIter', 1000, 'Replicates', 10);
end
