function XX = calc_XX(X)
[n, p] = size(X);
XX = zeros(p, n*n);
% XX = sparse(p, n*n);
for i=1:p
%     disp(i)
    Xi = repmat(X(:, i), 1, n);
    XX(i, :) = reshape(Xi - Xi', n*n, 1);
end
end