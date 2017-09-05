function [W, out] = KDR(X, XX, G, opts)

% addpath([pwd '/FOptM/']);

if opts.init == 0
    [~, p] = size(X);
    W = rand(p, opts.k);
    [W, ~, ~]=svd(W, 0);
else
    W = opts.W;
end

opts_StiefelGBB.record = 0;
opts_StiefelGBB.mxitr  = 1000;
opts_StiefelGBB.xtol = 1e-5;
opts_StiefelGBB.gtol = 1e-5;
opts_StiefelGBB.ftol = 1e-8;

[W, out]= OptStiefelGBB(W, @kdrgradient, opts_StiefelGBB, X, XX, G, opts.k, opts.sigma);

end

function [f, g] = kdrgradient(W, X, XX, G, k, sigma)
[n, p] = size(X);
Z = X*W;
K = rbf_kernel(Z, sigma);
ZZ = zeros(k, n*n);
for i=1:k
    Zi = repmat(Z(:, i), 1, n);
    ZZ(i, :) = reshape(Zi - Zi', n*n, 1);
end
g = (repmat(reshape(G.*K, 1, n*n), p, 1) .* XX) * ZZ' / sigma / sigma;
f = - sum(sum(K.* G));
end
