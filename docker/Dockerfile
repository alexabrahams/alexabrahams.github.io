FROM harshjv/texlive-2015
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo tlmgr --repository http://www.preining.info/tlgpg/ install tlgpg
RUN tlmgr update --self --all
