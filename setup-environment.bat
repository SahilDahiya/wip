@echo off
REM ---------------------------------------------------------------------------
REM Sets up the environment for development.
REM This will create a local python setup including required modules.
REM After running the script the environment should be activated.
REM ---------------------------------------------------------------------------

REM Make sure we are in the current directory.
cd /d %~dp0

REM The list of required python modules.
set python_modules=pandas numpy scikit-learn gensim nltk matplotlib ipykernel

REM Create the python environment if it does not exist.
if not exist venv (
    echo "Creating new python environment."
    python -m venv "venv"
	if %ERRORLEVEL% GEQ 1 (
	    echo Failed to create python environment.
	    exit /B 1
	)
)

REM Activates the python environment.
call venv\Scripts\activate.bat


REM Make sure pip is up to date.
python -m pip install --upgrade pip
if %ERRORLEVEL% GEQ 1 (
	echo Failed to upgrade pip.
	exit /B 1
)

REM Make sure the required python modules are installed.
python -m pip install %python_modules%
if %ERRORLEVEL% GEQ 1 (
	echo Failed to install python modules.
	exit /B 1
)

REM python -m ipykernel install --user --name venv --display-name nlp1

