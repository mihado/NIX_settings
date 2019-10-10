export BASH_SILENCE_DEPRECATION_WARNING=1

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

# Android SDK - NDK
export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_DEFAULT_BUILD_TOOLS=26.0.0
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_DEFAULT_BUILD_TOOLS"

export PATH="$HOME/.fastlane/bin:$PATH"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/imagemagick@6/lib/pkgconfig"
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

# cuda
export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
# cuDNN
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# added by Miniconda3 installer
export PATH="/usr/local/miniconda3/bin:$PATH"

# http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# use git installed by homebrew
export PATH="/usr/local/bin:/usr/bin:$PATH"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# homebrew asdf
source /usr/local/opt/asdf/asdf.sh

eval "$(direnv hook bash)"
