#!make
# Deno parameters
DENO=deno
BUNDLE=$(DENO) bundle
RUN=$(DENO) run
TEST=$(DENO) test
FMT=$(DENO) fmt
LINT=$(DENO) lint
BUILD=${DENO} compile
DEPS=${DENO} info
DOCS=${DENO} doc mod.ts --json
INSPECT=${DENO} run --inspect
VERSION=0.0.1
DESCRIPTION=Deno template
AUTHOR=stephendltg
DENOVERSION=1.18.1

all: install

install: 
	@echo "Installing project..."
	$(DENO) upgrade --version ${DENOVERSION}
	$(DENO) install

version:
	@echo "Version Deno ..."
	$(DENO) --version

upgrade:
	@echo "Update Deno ..."
	$(DENO) upgrade

tool:
	@echo "Deno tools ..."
	${DEPS}
	${FMT} --check
	${LINT} --unstable

fmt: 
	@echo "Deno format ..."
	${FMT}

dev:
	@echo "Deno dev ..."
	$(RUN) --allow-all --unstable --watch mod.ts 

test:
	@echo "Deno test ..."
	$(TEST) --coverage=cov_profile

bundle:
	@echo "Deno bundle ..."
	$(BUNDLE) mod.ts module.bundle.js
	
clean:
	@echo "Deno clean ..."
	rm -f module.bundle.js

compile:
	@echo "Deno Compile ..."
	$(BUILD) -A --unstable mod.ts
  
cli:
	@echo "Deno install global cli ..."
  ${DENO} install -f -A -n deno-app mod.ts
  
remove-cli:
	@echo "Deno remove cli ..."
  ${DENO} uninstall deno-app

inspect:
	@echo "Deno inspect ..."
	@echo "Open chrome & chrome://inspect"
	${INSPECT} --allow-all --unstable mod.ts

doc:
	@echo "Deno doc ..."
	$(DOCS) > docs.json

env:
	@echo "Version: $(VERSION)"
	@echo "Description: $(DESCRIPTION)"
	@echo "Author: $(AUTHOR)"
	@echo "Deno: ${DENOVERSION}"
	$(DEPS)
