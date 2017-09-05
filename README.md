# Kernel-Conditional-Clustering
Kernel Conditional Clustering (KCC)

## Dependencies
Data preprocessing: **Python** (2.7.12); **numpy** (1.13.1), **scipy** (0.19.1), **scikit-learn** (0.18.1), **pandas** (0.19.2), **beautifulsoup4** (4.6.0). All of the packages are available via **pip** (9.0.1). Tested on **Ubuntu** (16.04).

Kernel Conditional Clustering (KCC) tested on Matlab R2016b.

## KCC usage
The implementation of KCC is in ``KCC.m``:

    H_normalized = KCC(X, z, k, d)

Input:

    X: n x p matrix of n samples and p feaures

    z: n x m matrix of n samples and m features

    k: an integer indicating the number of clusters
    
    d: an integer indicating the dimensionality of embedding (usually set d = k)

Output:

    H_normalized:  n x d matrix of n samples and d features
        
## Scripts for generating datasets (unzip webkb-data.gtar.gz and CMUFace.tar.Z firstly)

    python create_Simulation.py
    python create_Multi.py
    python create_DLBCL.py
    python create_Webkb.py
    <Your Path>/matlab -nodisplay -nosplash -nodesktop -r "run('create_Face.m')"
    
## Scripts for running the demo

    <Your Path>/matlab -nodisplay -nosplash -nodesktop -r "run('demo.m')"

## Contact

Any questions can be directed to:

   * Xiao He: xiao.he [at] bsse.ethz.ch

