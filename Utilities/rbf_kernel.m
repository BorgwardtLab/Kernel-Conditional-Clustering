function Kx = rbf_kernel(X, SGX)
    [N, M]=size(X);
    sx2=2*SGX*SGX;
    ab=X*X';
    aa=diag(ab);
    D=repmat(aa,1,N);
    xx=max(D + D' - 2*ab, zeros(N,N));
    Kx=exp(-xx./sx2);      
end