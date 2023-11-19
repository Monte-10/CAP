FROM base:latest

ADD worker.sh /root

# chmod +x master.h
RUN chmod +x /root/worker.sh
CMD ["/root/worker.sh"]