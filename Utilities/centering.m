function G = centering(K)

[n, ~] = size(K);

unit=ones(n,n);
I=eye(n);
Q=I-unit./n;

G = Q*K*Q;

end