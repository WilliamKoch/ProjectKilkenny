# ProjectKilkenny

## File Directory

## Setting up your global environment

We will be using pyenv and pyenv-virtualenv to manage virtual environments between machines.

1. Check to see if you have these installed by running the following on your machine.

`pyenv --version` 

If this returns something like `pyenv 1.2.21`, you have this installed.

`brew list --versions pyenv-virtualenv` (assuming MacOSX)

If this returns something like `pyenv-virtualenv 1.1.5`, you have this installed.

(TBD: How to install on Linux/Mac)

2. If you don't have these installed, these can be installed with the following commands:

pyenv: 
    MacOS: `brew install pyenv`
    Linux: TBD
    Windows: TBD

pyenv-virtualenv: 
    MacOS: `brew install pyenv-virtualenv`
    Linux: TBD
    Windows: TBD

3. Navigate to the root of this project and run the following command to set up you virtual environment.

`pyenv virtualenv 3.8.3 ProjectKilkenny`

The `.python-version` should automatically load this environment when you navigate to the root of this repo.  If not, you may need to run `pyenv local ProjectKilkenny`.  This will cause your virtual environment to be loaded whenever you are in this directory.

4. Now we need to install all the Python dependencies for this project.  With your virtual environment active, run `pip install -r requirements.txt`.  This will install all the Python dependencies in the `requirements.txt` file.

## Setting up your dbt environment (`/kilkenny-transform`)

