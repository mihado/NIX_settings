source ~/.bashrc
source ~/.bash_aliases
[[ -s ~/.paths ]] && source ~/.paths
[[ -s ~/.env ]] && source ~/.env

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# http://wiki.octave.org/Installing_MacOS_X_Bundle
# set the default gnuplot terminal
# export GNUTERM=x11

# rbenv
eval "$(rbenv init -)"

# python
export PATH="/usr/local/miniconda3/bin:$PATH"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# homebrew asdf
source /usr/local/opt/asdf/asdf.sh

# http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# use git installed by homebrew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Android SDK - NDK
export ANDROID_NDK=/usr/local/opt/android-ndk
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_DEFAULT_BUILD_TOOLS=26.0.0
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_DEFAULT_BUILD_TOOLS"

export PATH="$HOME/.fastlane/bin:$PATH"

export CLASSPATH="$CLASSPATH:/usr/local/opt/junit/junit.jar"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"
export PATH="/usr/local/opt/elasticsearch@1.7/bin:$PATH"

# cuda
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$CUDA_HOME:$CUDA_HOME/extras/CUPTI/lib"
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH

# dingy - docker
export DINGHY_HOST_MOUNT_DIR="/Users/katze/dinghy-docker-share"
export DINGHY_GUEST_MOUNT_DIR="/Users/katze/dinghy-docker-share"
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/katze/.docker/machine/machines/dinghy"
export DOCKER_MACHINE_NAME="dinghy"
eval $(docker-machine env dinghy)
