#!/bin/bash

docker run -it -p 8011:8011 svr93/astro.control-center bash -c \
"source ~/.bashrc && cd home/astro__server__control_center && node server.js --exchangeData='{}'"
