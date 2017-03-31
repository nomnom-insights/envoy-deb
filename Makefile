.PHONY: bin test package release

NAME := envoy
LETTER = $(shell expr substr $(NAME) 1 1)
VERSION := "1.2.0-$(strip $(shell git --git-dir ./envoy/.git rev-parse --short HEAD))"

bin:
	@echo "Creating Envoy binary"
	./build-bin.sh

package:
	@echo "Building envoy .deb"
	./make-deb.sh

test:
	@echo "Testing the package"
	./test/run.sh

release:
	@echo Uploading... $(NAME)_$(VERSION) .deb to $(BINTRAY_ORG)/$(BINTRAY_APT_REPO)
	@curl -v -T $(NAME).deb \
		-u $(BINTRAY_USERNAME):$(BINTRAY_API_KEY) \
		-H "X-Bintray-Debian-Distribution: stable" \
		-H "X-Bintray-Debian-Component: main"  \
		-H "X-Bintray-Debian-Architecture: amd64" \
			https://api.bintray.com/content/$(BINTRAY_ORG)/$(BINTRAY_APT_REPO)/$(NAME)/$(VERSION)/pool/main/$(LETTER)/$(NAME)/$(NAME)_$(VERSION)_amd64.deb
	@echo Publishing
	@curl -X POST \
		-u $(BINTRAY_USERNAME):$(BINTRAY_API_KEY) \
		https://api.bintray.com/content/$(BINTRAY_ORG)/$(BINTRAY_APT_REPO)/$(NAME)/$(VERSION)/publish
