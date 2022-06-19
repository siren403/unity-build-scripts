#!/bin/bash

function build {
    unity-editor -quit -nographics -projectPath /app -executeMethod UActions.Bootstrap.Run -logfile - -buildTarget $PLATFORM -job $1
}

function run-lane {
    cd unity-build-scripts/fastlane
    bundle install
    export FL_UNITY_EXECUTE_METHOD=UActions.Bootstrap.Run
    bundle exec fastlane $PLATFORM $@
}

function deploy {
    restore $PRODUCT_NAME
    build $1
    cache $PRODUCT_NAME
    run-lane $2
}

function restore {
    tar -xvf /tmp/buildkite-$1-cache.tar || true
}

function cache {
    tar -cf /tmp/buildkite-$1-cache.tar ./Library
}

function log {
    pwd
}

function args {
    arr=("$@")
    for i in "${arr[@]}";
    do
        echo "$i"
    done
}  

function init {
    echo do init
}

"$@"
# restore $PRODUCT_NAME-$PLATFORM
# cache $PRODUCT_NAME-$PLATFORM
