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
