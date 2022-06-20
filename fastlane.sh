#!/bin/bash

cd "./unity-build-scripts/fastlane"

eval "$(rbenv init -)"
bundle install

# fastlane
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bundle exec fastlane $PLATFORM "$@" 