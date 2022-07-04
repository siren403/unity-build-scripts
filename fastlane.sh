#!/bin/bash

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init --path)"

export XCODE_ROOT=$WORK_DIR/$UNITY_PROJECT_ROOT/Build/$PLATFORM/$PRODUCT_NAME
cd $XCODE_ROOT && if [ -f "./Podfile" ]; then pod install; fi
cd $WORK_DIR/$UNITY_PROJECT_ROOT

cd "./unity-build-scripts/fastlane/"

bundle install

# fastlane
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bundle exec fastlane $PLATFORM "$@"
