dataName = 'Simu1'; 

addpath([pwd '/Utilities/']);

[X, y, z, k] = read_data(dataName);
e = k;
U = KCC(X, z, k, e);

stream = RandStream.getGlobalStream;
reset(stream);

clustering = kmeans(U, k, 'MaxIter', 1000, 'Replicates', 100);
result = ClusteringMeasure(y, clustering);
if length(unique(z)) == length(z)
    fprintf('%s, ACC:%f, NMIg:%f\n', dataName, result(1), result(2));
else
    NMIc = NMI(z, clustering);
    JI = Jaccard(z, clustering);
    fprintf('%s, ACC:%f, NMIg:%f, NMIc:%f, JI:%f\n', dataName, result(1), result(2), NMIc, JI);
end