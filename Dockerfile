FROM quay.io/eduk8s/base-environment:master


COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

USER root

RUN HOME=/root && \
    yum upgrade skaffold

USER 1001

RUN fix-permissions /home/eduk8s
