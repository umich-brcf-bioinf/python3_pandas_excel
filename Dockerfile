FROM continuumio/miniconda3:4.10.3

ARG env_name

# env_name is supplied as --build-arg to docker, and is identical between yaml file basename and environment name specified within it
COPY ${env_name}.yaml /tmp/

RUN conda env create -f /tmp/${env_name}.yaml && conda clean --all -y

ENV PATH /opt/conda/envs/${env_name}/bin:$PATH

