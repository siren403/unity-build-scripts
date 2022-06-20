#!/bin/bash

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init --path)"

cd "./unity-build-scripts/fastlane/"

bundle install

# fastlane
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bundle exec fastlane $PLATFORM "$@"
