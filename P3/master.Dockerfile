FROM base:latest

ADD master.sh /root

# chmod +x master.h
RUN chmod +x /root/master.sh
CMD ["/root/master.sh"]