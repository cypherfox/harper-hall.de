

HUGO_VERSION=0.74.3
DOCS_NAMESPACE=fcloud-docs

HUGO_CMD=tmp/bin/hugo-$(HUGO_VERSION)
HUGO_ARCHIVE=tmp/hugo-$(HUGO_VERSION).tgz

.PHONY: run-local

OSFLAG 				:=
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OSFLAG = Linux
else ifeq ($(UNAME_S),Darwin)
	OSFLAG = macOS
endif

run-local: $(HUGO_CMD)
	$(HUGO_CMD) server -D -s . 
	
$(HUGO_CMD): $(HUGO_ARCHIVE)
	mkdir -p tmp/bin
	tar -xvz -C tmp -f tmp/hugo-$(HUGO_VERSION).tgz 
	mv tmp/hugo tmp/bin/hugo-$(HUGO_VERSION)

$(HUGO_ARCHIVE):
	mkdir -p tmp
	curl -Lo $(HUGO_ARCHIVE) https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${OSFLAG}-64bit.tar.gz

deploy:
	chmod a+x ./ci/configure_versions.sh
	VERSION=`./ci/configure_versions.sh` ; yq w -i ci/fcloud-docs.prod.yaml version $$VERSION
	helm repo update
	deployctl apply --values ci/fcloud-docs.prod.yaml --namespace $(DOCS_NAMESPACE)
	
