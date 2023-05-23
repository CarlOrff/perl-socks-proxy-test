FROM perl:5.36-bullseye
COPY tor.list /etc/apt/sources.list.d/
RUN apt-get update --allow-insecure-repositories
RUN apt-get install -y apt-utils --allow-unauthenticated
RUN apt install -y net-tools --allow-unauthenticated
RUN apt-get -y install systemctl --allow-unauthenticated
RUN apt-get -y install tsocks
RUN apt install -y apt-transport-https --allow-unauthenticated
RUN cpanm LWP::UserAgent
RUN cpanm LWP::Protocol::socks
RUN cpanm LWP::Protocol::socks4
RUN cpanm --uninstall LWP
RUN cpanm LWP@6.69
RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
RUN apt-get install -y tor deb.torproject.org-keyring --allow-unauthenticated
RUN apt-get install -y bash --allow-unauthenticated
RUN apt-get clean all
COPY . /usr/src/archive
WORKDIR /usr/src/archive
RUN chmod +x ./init.sh
CMD ["/usr/src/archive/init.sh"]