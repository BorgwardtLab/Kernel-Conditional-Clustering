function Z = convertZ(z)

Z = [];
for i=1:size(z, 2)
    Z = [Z, labelencode(z(:, i))];
end