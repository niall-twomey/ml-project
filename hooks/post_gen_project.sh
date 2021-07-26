#!/bin/bash

# Set up git environment 
git init 

# Set up the pre-commit hook environment 
pip install pre-commit 
pre-commit install 

# Install the pipenv environment
pipenv install --dev 

