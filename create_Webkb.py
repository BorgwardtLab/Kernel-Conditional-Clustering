import re
from os import listdir
import numpy as np
import pandas as pd
import scipy.io as sio
from bs4 import BeautifulSoup

from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer

group1 = ['course', 'faculty', 'project', 'student']
group2 = ['cornell', 'texas', 'washington', 'wisconsin']
doc_name = []
doc_group1 = []
doc_group2 = []
corpus = []
for g1 in group1:
    for g2 in group2:
        folder = 'webkb/%s/%s/' % (g1, g2)
        for f in listdir(folder):
            if not f.startswith('.'):
                doc_name.append(f)
                doc_group1.append(g1)
                doc_group2.append(g2)
                with open('%s%s' % (folder, f)) as fp:
                    soup = BeautifulSoup(fp)
                corpus.append(soup.get_text())
vectorizer = CountVectorizer(stop_words='english', min_df=0.05)
X_counts = vectorizer.fit_transform(corpus).toarray()
feature_name = np.array(vectorizer.get_feature_names())

le = LabelEncoder()
y1 = le.fit_transform(doc_group1)
y2 = le.fit_transform(doc_group2)

transformer = TfidfTransformer(smooth_idf=False)
X_counts_tfidf = transformer.fit_transform(X_counts)

data = {}
data['group1'] = group1
data['group2'] = group2
data['feature_name'] = feature_name
data['doc_name'] = doc_name
data['X'] = X_counts_tfidf
data['y1'] = y1
data['y2'] = y2
sio.savemat('Webkb.mat', data)

