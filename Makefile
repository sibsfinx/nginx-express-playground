.PHONY: docker-all docker-build docker-run start docker-prod-start

.DEFAULT_GOAL := docker-all

docker-all: docker-build docker-run

docker-build:
	docker buildx build -t minimal-nginx-express .

docker-run:
	docker run -p 8080:8080 minimal-nginx-express

start:
	node --experimental-strip-types src/server.ts