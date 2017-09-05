function Y = labelencode(y)
    n = length(y);
    label = unique(y);
    Y = zeros(n, length(label));
    for i=1:length(label)
        Y(y==label(i), i) = 1;
    end
end