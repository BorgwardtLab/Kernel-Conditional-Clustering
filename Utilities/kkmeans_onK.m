function clustering = kkmeans_onK(K, k)
    [H, ~] = eigs(K, k, 'la');
%     disp(trace(K*H*H'));
%     [H, V] = eigs(K, size(K,1)-1, 'la');
    H_normalized = H ./ repmat(sqrt(sum(H.^2, 2)), 1, k);

    stream = RandStream.getGlobalStream;
    reset(stream);
    clustering = kmeans(H_normalized, k, 'MaxIter', 1000, 'Replicates', 100);
end
