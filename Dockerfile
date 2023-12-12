FROM tiicrc/claasp-lib:latest
USER root
RUN curl -fsSL https://code-server.dev/install.sh | sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENV SHELL=/bin/bash
ENTRYPOINT ["/docker-entrypoint.sh"]