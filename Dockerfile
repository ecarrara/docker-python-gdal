FROM ubuntu:16.04
MAINTAINER Erle Carrara <carrara.erle@gmail.com>

RUN apt-get update && \
    apt-get -y install \
        wget \
        libcurl4-openssl-dev \
        build-essential \
        libpq-dev \
        ogdi-bin \
        libogdi3.2-dev \
        libjasper-runtime \
        libjasper-dev \
        libjasper1 \
        libgeos-c1v5 \
        libproj-dev \
        libpoppler-dev \
        libsqlite3-dev \
        libspatialite-dev \
        python \
        python-pip \
        python-dev \
        python-numpy-dev


RUN wget http://download.osgeo.org/gdal/2.1.3/gdal-2.1.3.tar.gz -O /tmp/gdal-2.1.3.tar.gz && \
    tar -x -f /tmp/gdal-2.1.3.tar.gz -C /tmp

RUN cd /tmp/gdal-2.1.3 && \
    ./configure \
        --prefix=/usr \
        --with-python \
        --with-geos \
        --with-geotiff \
        --with-jpeg \
        --with-png \
        --with-expat \
        --with-libkml \
        --with-openjpeg \
        --with-pg \
        --with-curl \
        --with-spatialite && \
    make && make install

RUN pip install GDAL==2.1.3

CMD ["python2"]
