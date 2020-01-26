.PHONY: list
list:
	@echo "Targets:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

define build
./build.sh -t $(1)
endef

define publish
./publish.sh -t $(1) -d $(2)
endef

.PHONY: stix_fonts_layer
stix_fonts_layer:
	$(call build, fonts/stix_fonts/)

.PHONY: publish_stix_fonts_layer
publish_stix_fonts_layer: stix_fonts_layer
	$(call publish, fonts/stix_fonts/, "Stix fonts in AWS Lambda [https://www.stixfonts.org/]")