#!/bin/bash

# Define variables
PROJECT_NAME="{{ cookiecutter.project_name }}"
ENVIRONMENT_TYPE="{{ cookiecutter.environment }}"
PYTHON_VERSION="{{ cookiecutter.python_version }}"
INSTALL_RECOMMENDED="{{ cookiecutter.install_recommended }}"

# Initialise git  
git init 

# Create environment if needed
echo "Setting up environment..."
if [ "$ENVIRONMENT_TYPE" = "conda" ]; then
  if conda info --envs | grep -q "$PROJECT_NAME"; then 
    echo "Conda environment already exists. Skipping."
  else
    echo "Creating new conda environment" 
    conda create --name "$PROJECT_NAME" python="$PYTHON_VERSION" -y
  fi 
  
  conda activate "$PROJECT_NAME"
  
  conda install pre-commit -y
else
  pip install pre-commit 
fi

# Install pre-commit hooks 
pre-commit install 

# Install the optional libraries
if [ "$INSTALL_RECOMMENDED" = "yes" ]; then 
  if conda info --envs | grep -q "$PROJECT_NAME"; then 
    conda install numpy scipy pandas matplotlib seaborn scikit-learn pyyaml tqdm jupyter ipython -y
  else
    pip install numpy scipy pandas matplotlib seaborn scikit-learn pyyaml tqdm jupyter ipython
  fi 
fi 


