## DRH Icecast-KH 15

git add README.md


# Сборка образа локально

docker build -t drh-icecast-kh:latest -f ./docker/icecast-kh/Dockerfile .

# Запуск контейнера

docker run -p 8123:80 --name drh-icecast-kh drh-icecast-kh