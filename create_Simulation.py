import numpy as np
import scipy.io as sio
from sklearn import datasets

from sklearn.preprocessing import scale

np.random.seed(0)

X1, y1 = datasets.make_blobs(n_samples=600, random_state=8)
X2, y2 = datasets.make_blobs(n_samples=600, random_state=1)
X = np.hstack([X1, X2])
z = y1
y = y2
data = {}
data['X'] = X
data['z'] = z
data['y'] = y
sio.savemat('Simu1.mat', data)


X1, y1 = datasets.make_blobs(n_samples=900, random_state=8)
X2, y2 = datasets.make_moons(n_samples=600, noise=0.1, random_state=1)
X1 = scale(X1)
X2 = scale(X2)
X2 = X2[np.where(y2==0)]
X2[:, 0] = X2[:, 0] * 2
X2[:, 1] = X2[:, 1]
X3 = X1[np.where(y1==2)]
X3 = X3*1.5
X3[:, 0] = X3[:, 0] + 1
X3[:, 1] = X3[:, 1] + 1.5
X1 = X1[np.where(y1!=2)]
y1 = y1[np.where(y1!=2)]
X2 = np.vstack([X2, X3])
y2 = np.ones([600,], dtype=np.int)
y2[300:] = 0
X3 = X1[np.where(y1==0)]
X4 = X1[np.where(y1==1)]
X3[:, 1] = X3[:, 1] + 0.5
X4[:, 1] = X4[:, 1] - 0.5
X1 = np.vstack([X3, X4])
perm = np.random.permutation(600)
X1 = X1[perm]
y1 = y2[perm]
X = np.hstack([X1, X2])
z = y1
y = y2
data = {}
data['X'] = X
data['z'] = z
data['y'] = y
sio.savemat('Simu2.mat', data)


y1 = np.random.rand(600)
X1 = np.zeros([600, 2])
X1[:, 0] = y1*15 + np.random.randn(600)
X1[:, 1] = y1*20 + np.random.randn(600)
X2, y2 = datasets.make_blobs(n_samples=600, random_state=1)
X = np.hstack([X1, X2])
z = y1
y = y2
data = {}
data['X'] = X
data['z'] = z
data['y'] = y
sio.savemat('Simu3.mat', data)
