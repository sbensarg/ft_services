FROM alpine:3.11
COPY . .
RUN chmod +x install.sh
RUN ./install.sh
EXPOSE 8086
RUN chmod +x start.sh
VOLUME ['/sys/fs/cgroup']
CMD  ./start.sh && tail -f /dev/null