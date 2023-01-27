FROM lscr.io/linuxserver/wireguard

RUN \
 echo "**** install dependencies ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
	squid && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
CMD ["squid", "-N"]
