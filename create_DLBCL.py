import numpy as np
import scipy.io as sio

def read_gct(fn):
    with open(fn, 'rb') as f:
        for i, line in enumerate(f):
            if i == 1:
                row = line.split('\t')
                p = int(row[0])
                n = int(row[1])
                break
    X = np.zeros([n, p])
    with open(fn, 'rb') as f:
        for i, line in enumerate(f):    
            if i > 2:
                row = line.split('\t')
                for j in range(len(row)):
                    if j > 1:
                        X[j-2, i-3] = float(row[j])
    return X



A = read_gct('DLBCL/DLBCL_A.gct.txt')
B = read_gct('DLBCL/DLBCL_B.gct.txt')

l1 = np.genfromtxt('DLBCL/DLBCL_A.cls', skip_header=2)
l2 = np.genfromtxt('DLBCL/DLBCL_B.cls', skip_header=2)

X = np.vstack([A, B])
y = np.append(l1, l2)
Z = np.ones(X.shape[0])
Z[l1.shape[0]:] = 2;

data = {}
data['X'] = X
data['y'] = y
data['Z'] = Z

sio.savemat('DLBCL.mat', data)