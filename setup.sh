# Installation Shell Script
# Comment out any lines for apps you do not want included.

# Install Homebrew:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update
brew update

# Install iTerm2
brew install --cask iterm2

# Install Python Environment Manager
brew install pyenv
pyenv install 3.9.4
pyenv global 3.9.4
echo <<'EOF' >> ~/.zshrc
# Aliases
alias python=/usr/bin/python3
alias pip='pip3'
alias add='git add'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias diff='git diff'
alias gitgud='git reset --HARD'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias pushup='git push upstream=origin'
alias wrk='cd ~/repos'

# Environment Variables
#export SPARK_HOME="/usr/local/Cellar/apache-spark/3.1.2/libexec/"
#export PATH="$HOME/.poetry/bin:/Library/Java/JavaVirtualMachines/jdk-16.0.2.jdk/Contents/Home/bin:$HOME/Library/Python/3.8/bin:$SPARK_HOME:$HOME/.jenv/bin:$PATH"
#export JAVA_HOME=$(/usr/libexec/java_home)
#export PYTHONPATH="$SPARK_HOME/python:$PYTHONPATH"
#export PYSPARK_DRIVER_PYTHON="jupyter"
#export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
#export PYSPARK_PYTHON="python3"

# Init env managers
#eval "$(jenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
EOF

# Install Poetry for python
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
mkdir ${ZSH_CUSTOM}/plugins/poetry
poetry completions zsh > ${ZSH_CUSTOM}/plugins/poetry/_poetry
sed -i'.original' -e 's/plugins=(/plugins=(poetry /g' ~/.zshrc

# Install Dash (API Documentation)
brew install --cask dash

# Install VS Code
brew install --cask visual-studio-code

# Install Docker Desktop
brew install --cask docker

# Install Fira Code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Install Java
brew install --cask java
brew install adoptopenjdk11
brew install jenv

source ~/.zshrc

# Install Spark
brew install scala
brew install apache-spark
pip install pyspark

# Install virtualenv
pip install virtualenv

# Install Git LFS
brew install git-lfs
git lfs install
git lfs pull

# Install parquet-tools
brew install parquet-tools