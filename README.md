# tensorflow-docker

This is simple Dockerfile to build a docker image based on Python 3.12 with Jupyter Notebook, Tensorflow 2.16, Keras 3.3.3 and Keras-NLP 0.12.0.

I built tensorflow-text whl for aarch64 from the source which is dependency of Keras-NLP and not available as binary for aarch64/arm64, yet.

You may install it on your docker image if you already had tensorflow and keras on your apple silicon.
It might be hard to find everything for Python 3.12.   For example, the official jupyter notebook doesn't have it yet.

Usage
```
$ pip install https://github.com/nicechester/tensorflow-docker/raw/main/wheels/tensorflow_text-2.16.1-cp312-cp312-linux_aarch64.whl
```

You may need to install hdf5 before installing tensorflow-text
```
$ apt update && apt install libhdf5-dev
```
