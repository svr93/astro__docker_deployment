#!/bin/bash

updateCmd=true
detached=false

while [[ "$1" != "" ]]; do
    case $1 in
        --updateGit )               updateCmd=". update.sh"
                                    ;;

        --detached )                detached=true
                                    ;;

        * )                         echo "error: bad param"
                                    ;;
    esac
    shift
done

docker run -it -p 8011:8011 -d=$detached svr93/astro.control-center bash -c \
"source ~/.bashrc && \
cd home/astro__server__control_center && \
$updateCmd && \
node server.js --exchangeData='$(cat exchangeData.json)'"
