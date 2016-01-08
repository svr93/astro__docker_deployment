upload=false

while [[ "$1" != "" ]]; do
    case $1 in
        --upload )                  upload=true
                                    ;;

        * )                         echo "error: bad param"
                                    ;;
    esac
    shift
done

IMAGE_NAME=astro.control-center
DOCKER_FILE_NAME=Dockerfile-$IMAGE_NAME

cp Dockerfile-common $DOCKER_FILE_NAME

GIT_NAME="astro__server__control_center"

echo "git clone https://github.com/svr93/$GIT_NAME && \ " >> $DOCKER_FILE_NAME
echo "cd $GIT_NAME && \ " >> $DOCKER_FILE_NAME
echo "bash preparation.sh" >> $DOCKER_FILE_NAME

docker build -t svr93/$IMAGE_NAME -f $DOCKER_FILE_NAME .

if [[ $? = 0 ]]; then

    echo "svr93/$IMAGE_NAME successfully built!"
fi

if [[ $upload = true ]]; then

    docker push svr93/$IMAGE_NAME
fi
