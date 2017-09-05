function D_sqrt = get_D(K)
N = size(K,1);
d = sum(K);
D = zeros(N);
for i = 1:N
    D(i,i) = d(i);
end
D_sqrt = diag(sqrt( diag(D).^(-1) ));