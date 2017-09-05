function score = VQE(X, Y)

k = length(unique(Y));
meanY = zeros(k, size(X,2));
for i=1:k
   meanY(i, :) = mean(X(Y==i)); 
end

score = 0;
for i=1:size(X,1)
    score = score + norm(X(i, :)-meanY(Y(i), :), 2)^2;
end
score = score / size(X, 1);
