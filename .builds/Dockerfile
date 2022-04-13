FROM ubuntu
ARG UID=1000
ARG GID=1000

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --quiet && apt-get install -y --quiet ssh git sudo locales net-tools inetutils-ping man-db\
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
	&& bash ~/dotfiles/install.sh \
	&& touch ~/.sudo_as_admin_successful

CMD ["bash"]