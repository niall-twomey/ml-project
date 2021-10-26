.PHONY: create_env activate_env run 

include .env

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(shell basename $(PROJECT_DIR))

PYTHON = python

MAKE = /usr/bin/make

{% if cookiecutter.environment == "local" %}
create_env: 
	
activate_env: 
	
{% elif cookiecutter.environment == "conda" %}

nt_conda_session 

create_env: 
	conda create --name {{ cookiecutter.project_name }}
	
activate_env: 
	conda activate {{ cookiecutter.project_name }}
	
{% elif cookiecutter.environment == "pipenv" %}
create_env: 
	pipenv install
	
activate_env: 
	pipenv shell
	
{% endif %}

run:
	$(PYTHON) main.py 
	
#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

# https://github.com/drivendata/cookiecutter-data-science/blob/master/%7B%7B%20cookiecutter.repo_name%20%7D%7D/Makefile

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: help
help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
	
.SILENT
