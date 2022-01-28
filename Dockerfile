FROM continuumio/miniconda3

RUN conda install -c conda-forge gsl=2.7 && \
    conda install -c conda-forge lapack=3.9.0 && \
    conda install -c conda-forge armadillo=10.8.1 && \
    conda install -c conda-forge gxx_linux-64=11 gcc_linux-64=11 make

ENV LD_LIBRARY_PATH=/opt/conda/lib

#RUN git clone --branch v1.0 https://github.com/xyz111131/PhyloAcc.git && \
RUN wget -q https://github.com/xyz111131/PhyloAcc/archive/refs/tags/v1.0.tar.gz && \
    tar xvzf v1.0.tar.gz && \
    rm v1.0.tar.gz && \
    cd PhyloAcc-1.0 && \
    sed -i "/CXX=/c\CXX=x86_64-conda-linux-gnu-g++" Makefile && \
    sed -i "/GSL_INCLUDE=/c\GSL_INCLUDE=/opt/conda/include/" Makefile && \
    sed -i "/GSL_LIB=/c\GSL_LIB=/opt/conda/lib/" Makefile && \
    sed -i "/PREFIX=/c\PREFIX=/opt/conda" Makefile && \
    make clean && make && make install

CMD ["/opt/conda/bin/PhyloAcc"]
