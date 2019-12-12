.PHONY: serve build

serve:
	hugo server \
	--ignoreCache \
	--buildFuture

build:
	hugo
