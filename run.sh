#!/bin/bash

updateCmd=true
detachedMode=false

while [[ $1 != "" ]]; do

    case $1 in

        --updateGit )               updateCmd=". update.sh"
                                    ;;

        --detachedMode )            detachedMode=true
                                    ;;

        * )                         echo "error: bad param"
                                    ;;
    esac
    shift
done

exchangeData="$(cat exchange-data.json)"

CONTROL_CENTER_PORT=$(echo $exchangeData | \
    grep CONTROL_CENTER_PORT | \
    cut -d "}" -f1 | \
    cut -d "," -f1 | \
    cut -d ":" -f2)

docker run -it -p $(echo $CONTROL_CENTER_PORT):$(echo $CONTROL_CENTER_PORT) \
-d=$detachedMode svr93/astro.control-center bash -c \
"source ~/.bashrc && \
cd home/astro__server__control_center && \
$updateCmd && \
bash start.sh --exchangeData '$exchangeData'"
