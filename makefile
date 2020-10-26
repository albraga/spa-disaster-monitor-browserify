REPOSITORY = spa-disaster-monitor-browserify

help:
	@echo -B --always-make
	@echo first //make this the first and the only commit
	@echo repo //create repository

.PHONY: first
first:
	rm -rfv .git
	git init
	git add --all
	git commit -m "."
	git remote add origin https://github.com/albraga/${REPOSITORY}
	git push -u --force origin master 

.PHONY: repo
repo:
	curl -u 'albraga' https://api.github.com/user/repos -d '{"name":"${REPOSITORY}"}'
	$(MAKE) first

.PHONY: pull
pull:
	git fetch --all
	git reset --hard origin/master

.PHONY: push
push:
	git add --all
	git commit -m '.'
	git push

.PHONY: build
build:
	browserify src/index.js --standalone XXX > dist/main.js
	$(MAKE) docs

.PHONY: docs
docs:
	rm -rfv docs
	cp -rfv dist docs

.PHONY: serve
serve:
	cd docs && php -S localhost:8080