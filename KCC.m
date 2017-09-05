function H_normalized = KCC(X, z, k, d)

max_iter = 30;
tol = 1e-3;

if length(unique(z)) == length(z)
    Z = z;
else
    Z = convertZ(z);
end

XX = calc_XX(X);

KX = centering(rbf_kernel(X, MedianDist(X)));
KZ = centering(rbf_kernel(Z, MedianDist(Z)));
M = KZ / (KZ + 1e-8*eye(size(X,1)));
M = M * M';
K = KX - 2*KX*M + M*KX*M;
K = 0.5 * (K + K');

SGX = MedianDist(X);
opts.init = 0;
opts.k = d;
opts.sigma = SGX;
[W, ~] = KDR(X, XX, K, opts);

obj = zeros(max_iter,1);
for i=1:max_iter
    SGX = MedianDist(X*W);
    obj(i) = SGX;
    if i > 1
%         disp(abs(obj(i) - obj(i-1)) / obj(i-1));
        if abs(obj(i) - obj(i-1)) / obj(i-1) < tol
            break
        end
    end 
    opts.sigma = SGX;
    opts.W = W;
    opts.init = 1;
    [W, ~] = KDR(X, XX, K, opts);
end

obj = zeros(max_iter,1);
for i=1:max_iter
    KX = centering(rbf_kernel(X*W, SGX));
    K = KX - 2*KX*M + M*KX*M;
    K = 0.5 * (K + K'); 
    [U, ~] = eigs(K, k, 'la');
    obj(i) = trace(U'*K*U);
%     disp(obj(i));
    if i == 1
        best_U = U;
    else
        if obj(i-1) < obj(i)
            best_U = U;
        end
        if (obj(i) - obj(i-1)) / obj(i-1) < tol
            break
        end
    end        
    KU = centering(U*U');    
    K = KU - 2*KU*M + M*KU*M;
    K = 0.5 * (K + K');    
    [W, out] = KDR(X, XX, K, opts);     
end

H = best_U;
H_normalized = H ./ repmat(sqrt(sum(H.^2, 2)), 1, k);