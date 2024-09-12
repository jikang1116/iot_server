WORK_DIR=$(
    cd $(dirname $0)
    pwd
)

cd $WORK_DIR

image_name="cits5506-server"

docker container stop $image_name
docker container rm $image_name
docker build -t $image_name .
docker run -d -p 8090:8000 -v $WORK_DIR/db.sqlite3:/app/db.sqlite3 --name $image_name $image_name
