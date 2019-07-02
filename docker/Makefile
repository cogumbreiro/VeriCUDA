DOCKER=docker

all: build

build:
	$(DOCKER) build -f docker/Dockerfile -t vericuda .

run:
	$(DOCKER) run -it --rm vericuda

test:
	$(DOCKER) run -it --rm vericuda ./test.sh

.PHONY: build run test all

