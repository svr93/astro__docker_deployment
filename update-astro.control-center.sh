IMAGE_NAME=astro.control-center

DOCKER_FILE_NAME=Dockerfile-$IMAGE_NAME

cp Dockerfile-common $DOCKER_FILE_NAME

docker build -t svr93/$IMAGE_NAME -f $DOCKER_FILE_NAME .
echo "svr93/$IMAGE_NAME successfully built!"

docker push svr93/$IMAGE_NAME
