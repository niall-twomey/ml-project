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
  echo "Activating base conda just in case..."
  conda activate 

  if conda info --envs | grep -q "$PROJECT_NAME"; then 
    echo "Conda environment already exists. Skipping."
  else
    echo "Creating new conda environment" 
    conda create --name "$PROJECT_NAME" python="$PYTHON_VERSION" -y
  fi 

  echo "Activating new env..."
  conda activate "$PROJECT_NAME"

  echo "Installing pre-commit via conda..." 
  conda install -c conda-forge pre-commit -y
else
  echo "Installing pre-commit via pip..." 
  pip install pre-commit 
fi

# Install pre-commit hooks 
echo "Installing pre-commit hooks to git module..." 
pre-commit install 

# Install the optional libraries
if [ "$INSTALL_RECOMMENDED" = "yes" ]; then 
  echo "Installing dependencies..."
  
  if conda info --envs | grep -q "$PROJECT_NAME"; then 
    conda install numpy scipy pandas matplotlib seaborn scikit-learn pyyaml tqdm jupyter ipython -y
  else
    pip install numpy scipy pandas matplotlib seaborn scikit-learn pyyaml tqdm jupyter ipython
  fi 
fi 


