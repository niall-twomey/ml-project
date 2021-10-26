.PHONY: env_create env_shell run 

include .env

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(shell basename $(PROJECT_DIR))

PYTHON = python

MAKE = /usr/bin/make

{%- if cookiecutter.environment == "local" -%}
env_create: 
	
	
env_shell: 
	

{%- elif cookiecutter.environment == "conda" -%}
env_create: 
	conda create --name {{ cookiecutter.project_name }}
	
env_shell: 
	conda activate {{ cookiecutter.project_name }}
	
{%- elif cookiecutter.environment == "pipenv" -%}
env_create: 
	pipenv install
	
env_shell: 
	pipenv shell
	
{% endif %}

run:
	$(PYTHON) main.py 
	
