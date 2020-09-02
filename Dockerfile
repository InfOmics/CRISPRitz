# Set the base image to anaconda python 3.7
FROM continuumio/miniconda3

# File Author / Maintainer
MAINTAINER Samuele Cancelleri

ENV SHELL bash

#update conda channel with bioconda and conda-forge
RUN conda config --add channels defaults 
RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda

#update packages of the docker system
RUN apt-get update && apt-get install gsl-bin libgsl0-dev -y && apt-get install libgomp1 -y && apt-get clean

#Install crispritz package (change the dafault version of python to 3.7)
RUN conda update -n base -c defaults conda
RUN conda install python=3.7 -y
RUN conda install crispritz -y && conda clean --all -y

#Update base environment
#COPY environment_droplet.yml /home/environment_droplet.yml
#RUN conda env update --name base --file /home/environment_droplet.yml
