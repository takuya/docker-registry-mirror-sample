
name=registry-proxy
registry=my.reg.example.com/takuya/docker/$(name)
expose=5000


all: build

build:
	docker build -t $(name) .

login: build
	docker run -it --rm  --init  $(name) sh 

run-ontop: build
	## no detach 
	docker run -it --rm  --init  -p $(expose):$(expose) $(name) 
run: build
	## make detach 
	docker run -it -d --rm  --init  -p $(expose):$(expose) $(name) 
	docker ps -l

run-and-login: run
	@sleep 1
	docker exec -it  $( docker ps -n 1  -q )  bash || docker exec -it  $( docker ps -n 1  -q ) sh

kill:
	docker kill  $(shell docker ps -n 1 -q ) 

registry:
	@docker build -t $(registry) .
push: registry
	@docker push $(registry)

