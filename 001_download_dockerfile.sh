#! /bin/bash

release="v2.6.0"

wget "https://raw.githubusercontent.com/tensorflow/tensorflow/""$release""/tensorflow/tools/dockerfiles/tflite-android.Dockerfile" -O tflite-android.Dockerfile
