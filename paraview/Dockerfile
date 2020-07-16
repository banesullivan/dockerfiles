FROM continuumio/miniconda3 AS conda
LABEL Maintainer="Bane Sullivan" Description="ParaView base container."
SHELL ["/bin/bash", "-c"]

USER root

WORKDIR /root

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgl1-mesa-dev xvfb tini && \
    rm -rf /var/lib/apt/lists/*

RUN conda install --quiet --yes -c conda-forge \
    ipywidgets \
    jupyter \
    ipython \
    pillow \
    paraview=5.8.0 \
    numpy \
    matplotlib \
    scipy

# Now register ParView's bundled VTK with pip:
RUN mkdir vtk
WORKDIR vtk
COPY setup.py .
RUN mkdir vtk
RUN mv $(python -c 'import site; print(site.getsitepackages()[0])' 2>&1)/vtk.py vtk/__init__.py
RUN pip install -e .
WORKDIR /root

COPY test_pv_install.py .

COPY start_xvfb.sh /sbin/start_xvfb.sh
RUN chmod a+x /sbin/start_xvfb.sh

ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh"]
CMD ["/bin/bash"]
