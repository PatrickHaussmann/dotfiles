FROM ubuntu
ARG UID=1000
ARG GID=1000

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq install ssh git sudo locales net-tools inetutils-ping man-db \
	&& ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && DEBIAN_FRONTEND=noninteractive apt-get -qq install tzdata \
    \
    && rm -rf /var/lib/apt/lists/* && apt-get -qq clean \
    \
    && sed -i 's/^# *\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen \
    && sed -i 's/^# *\(de_DE.UTF-8 UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    \
    && groupadd -g $GID patrick \
    && useradd -m -u $UID -g $GID -s /bin/bash patrick \
    && adduser patrick sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER patrick
WORKDIR /home/patrick
ENV PROMPT_RED_HOST=true

RUN git clone https://git.sr.ht/~patrickhaussmann/dotfiles ~/dotfiles \
	&& DEBIAN_FRONTEND=noninteractive bash ~/dotfiles/install.sh \
    && sudo rm -rf /var/lib/apt/lists/* && sudo apt-get -qq clean \
	&& touch ~/.sudo_as_admin_successful

CMD ["bash"]
