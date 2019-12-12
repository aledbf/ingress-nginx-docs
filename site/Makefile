DOCKER       = docker
HUGO_VERSION = 0.60.1
DOCKER_IMAGE = ingress-nginx-hugo
DOCKER_RUN   = $(DOCKER) run --rm --interactive --tty --volume $(CURDIR)/../:/src

.PHONY: all build docker-image serve help

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: docker-build ## Build site with production settings and put deliverables in ./public

docker-image: ## Build custom hugo docker image
	$(DOCKER) build . --tag $(DOCKER_IMAGE) --build-arg HUGO_VERSION=$(HUGO_VERSION)

build: ## Build site with production settings and put deliverables in ./public
	hugo --minify

docker-build: docker-image ## Build site with production settings and put deliverables in ./public
	$(DOCKER_RUN) $(DOCKER_IMAGE) hugo --source site

npm:
	npm install postcss-cli autoprefixer

serve: docker-image ## Build site and serve the content
	$(DOCKER_RUN) -p 1313:1313 $(DOCKER_IMAGE) hugo server --buildFuture --bind 0.0.0.0 --source site
