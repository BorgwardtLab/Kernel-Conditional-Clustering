function y = labeldecode(Y)
    [n, m] = size(Y);
    y = zeros(n, 1);
    for i=1:m
        y(Y(:,i)==1) = i;
    end
end