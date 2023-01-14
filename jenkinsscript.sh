#!/bin/bash
. ~/.bashrc
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv versions

pyenv global 3.10.0
python3 -m venv myenv
source myenv/bin/activate
echo '#### Checking python ####'
which python3
python3 -V

echo '#### Installing requirements ####'
pip install -r ./requirements.txt

echo '#### Run tests ####'
pytest APITests --alluredir=./allure_results  --junitxml=./xmlReport/output.xml

echo '### deactivate virtual environment ###'
deactivate
echo '### change pyenv to system ###'
pyenv global system
