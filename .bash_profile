# terminal alias
PS1="$ "

# virtualenvwrapper
export WORKON_HOME=$HOME/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# rbenv
source ~/.profile
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# php - https://jason.pureconcepts.net/2016/09/upgrade-php-mac-os-x/
# from https://php-osx.liip.ch/
export PATH=/usr/local/php5/bin:$PATH

# paths
export PATH=/usr/local/bin:$PATH
