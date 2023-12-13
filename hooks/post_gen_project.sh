#!/bin/bash

# Activate environment
PROJECT_NAME = "{{ cookiecutter.project_name }}"
ENVIRONMENT_TYPE = "{{ cookiecutter.environment }}"
PYTHON_VERSION = "{{ cookiecutter.python_version }}"

# Set up git  
git init 

# Create environment if needed
echo "Setting up environment..."
if [ "${ENVIRONMENT_TYPE}" = "conda" ]; then
  if conda info --envs | grep -q "${PROJECT_NAME}"; then 
    echo "Conda environment already exists. Skipping."
  else
    echo "Creating new conda environment" 
    conda create --name "${}" python="${PYTHON_VERSION}"
  fi 
  
  conda activate "${PROJECT_NAME}"
  
  conda install pre-commit 
else
  pip install pre-commit 
fi

# Install pre-commit hooks 
pre-commit install 

echo export`which python` >> .env
