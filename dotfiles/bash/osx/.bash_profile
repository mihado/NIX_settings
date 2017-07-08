source ~/.bashrc
source ~/.bash_aliases
source ~/.projects
source ~/.env

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# http://wiki.octave.org/Installing_MacOS_X_Bundle
# set the default gnuplot terminal
# export GNUTERM=x11

# rbenv
eval "$(rbenv init -)"

# python
export PATH=/usr/local/miniconda3/bin:"$PATH"

# cuda
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$CUDA_HOME:$CUDA_HOME/extras/CUPTI/lib"
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# gvm
[[ -s "/Users/katze/.gvm/scripts/gvm" ]] && source "/Users/katze/.gvm/scripts/gvm"

# https://github.com/asdf-vm/asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# use git installed by homebrew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Android SDK - NDK
export ANDROID_NDK=/usr/local/opt/android-ndk
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

export PATH="$HOME/.fastlane/bin:$PATH"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"
export PATH="/usr/local/opt/elasticsearch@1.7/bin:$PATH"
