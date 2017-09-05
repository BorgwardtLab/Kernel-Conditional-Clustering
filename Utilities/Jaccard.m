function score = Jaccard(Y1, Y2)

n11 = 0;
n10 = 0;
n01 = 0;
N = size(Y1, 1);
for i=1:N
    for j=1:N
        if Y1(i) == Y1(j) & Y2(i) == Y2(j)
            n11 = n11 + 1;
        end
        if Y1(i) == Y1(j) & Y2(i) ~= Y2(j)
            n10 = n10 + 1;
        end
        if Y1(i) ~= Y1(j) & Y2(i) == Y2(j)
            n01 = n01 + 1;
        end
    end
end

score = n11 / (n11 + n10 + n01);