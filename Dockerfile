FROM ubuntu:latest

# install software with GUI
RUN apt-get update && apt-get install -y x11-apps
# RUN apt-get install firefox # unfortunately firefox stopped working because of snap

# entry points
# CMD ["/usr/bin/bash"]
CMD ["/usr/bin/xclock"]
