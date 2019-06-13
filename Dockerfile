FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --force-yes\
       man curl gnupg apt-utils software-properties-common net-tools bash-completion \
#    && curl -O https://dl-ssl.google.com/linux/linux_signing_key.pub \
#    && apt-key add linux_signing_key.pub \
#    && rm linux_signing_key.pub \
#    && add-apt-repository ppa:x2go/stable \
#    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
#    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \

#RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg 
#RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg 
#RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list 
#    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    #&& echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list.d/linuxmint.list \
    #&& echo "deb http://mozilla.debian.net/ jessie-backports firefox-release" >> /etc/apt/sources.list.d/debian-mozilla.list \
    #&& curl -O http://mozilla.debian.net/pkg-mozilla-archive-keyring_1.1_all.deb \
    #&& dpkg -i pkg-mozilla-archive-keyring_1.1_all.deb \
    #&& rm pkg-mozilla-archive-keyring_1.1_all.deb \

    && apt-get update \
    && apt-get install -y --force-yes\
#        xubuntu-desktop \
        libgconf-2-4 \
        sudo \
#        bash-completion \
        vim git \
	net-tools \
    iproute2 \
	inetutils-ping \
	openssh-server \
        cups \
        xfce4 \
        xfce4-whiskermenu-plugin \
	xfce4-terminal \
        terminator \
#        google-chrome-stable \
        firefox \
        pelican \
        wget \
        remmina \
        gdebi \
    	xterm \
        xrdp \
#        x2goserver x2goserver-xsession pwgen\
#	software-properties-common \
#        docker-ce \
#        code \
#    && rm /etc/apt/sources.list.d/google.list 
#    && apt-get upgrade -y 
#RUN curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o code_1.18.0-1510145176_amd64.deb 
#RUN dpkg -i code_1.18.0-1510145176_amd64.deb \
#RUN curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o code_amd64.deb
#RUN dpkg -i code_amd64.deb \
#    && rm code_amd64.deb \
#    && curl http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_amd64.deb -o /nomachine.deb \
#    && dpkg -i /nomachine.deb \
#    && rm /nomachine.deb \
#    && apt-get udate \
#    && apt-get install docker-ce\
    && mkdir /root/.config \
    && apt-get autoremove \
    && apt-get autoclean 
#RUN echo X2GO_NXAGENT_DEFAULT_OPTIONS+=\" -extension BIG-REQUESTS\" >> /etc/x2go/x2goagent.options
EXPOSE 22 4000

COPY config /root/.config
COPY scripts /scripts
COPY config/terminator root/.config/

# ENTRYPOINT ["/scripts/init.sh"]
