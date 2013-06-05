all:
	clear
	make css
	make js
	make html

install:
	npm install -g jade
	npm install -g stylus
	npm install -g component
	bash install.sh

html:
	jade sources/views/index.jade -O website/

css:
	stylus sources/styles/main.styl -o website/css/

js:
	bash compiler.sh

clean-js:
	rm -fr sources/javascript/build sources/javascript/components sources/javascript/template.js

ftp-push:
	clear
	make all
	git ftp push -u {place-user} -p {place-password} ftp://{place-site-address}

stage-deploy:
	git deploy stage

db-dump:
	mysqldump -u root -palfilasesino --opt atopica > data/dump.sql

db-update:
	sed 's/localhost\/atopica/atopica.xifox.net/g' data/dump.sql > data/production.sql

db-local-update:
	sed 's/atopica.xifox.net/localhost\/atopica/g' data/xifox_atopica.sql > data/local.sql

deploy:
	git deploy
.PHONY: install  html all css clean-js
