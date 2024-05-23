FROM arm64v8/python:latest

COPY wheels /tmp/wheels
RUN apt update && apt install libhdf5-dev -y
RUN pip3 install jupyter ipywidgets widgetsnbextension pandas-profiling
RUN pip3 install pandas scikit-learn seaborn plotly
RUN pip3 install /tmp/wheels/numpy-1.26.4-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
RUN pip3 install /tmp/wheels/h5py-3.11.0-cp312-cp312-linux_aarch64.whl
RUN pip3 install https://files.pythonhosted.org/packages/41/ab/e5386c722548df2043c1eaadc431ea3ba0ee42a66b3af7f8013bbbacecd3/tensorflow-2.16.1-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
RUN pip3 install /tmp/wheels/tensorflow_text-2.16.1-cp312-cp312-linux_aarch64.whl
RUN rm -fr /tmp/wheels
RUN pip3 install keras
RUN pip3 install keras_nlp

EXPOSE 8888

CMD [ "jupyter", "lab", "--allow-root", "--no-browser", "--port=8888", "--ip=0.0.0.0", "--notebook-dir=/root/workspace" ]
