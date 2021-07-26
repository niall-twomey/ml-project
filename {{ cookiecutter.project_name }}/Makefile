.PHONY: run

include .env

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(shell basename $(PROJECT_DIR))

VENVRUN = pipenv run
PYTHON = $(VENVRUN) python

MAKE = /usr/bin/make

run:
	$(PYTHON) main.py --arg val

