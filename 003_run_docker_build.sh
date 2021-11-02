#! /bin/bash

_HOME2_=$(dirname $0)
export _HOME2_
_HOME_=$(cd $_HOME2_;pwd)
export _HOME_

echo $_HOME_
cd $_HOME_

# docker info

mkdir -p $_HOME_/artefacts
mkdir -p $_HOME_/script
mkdir -p $_HOME_/workspace

# Encountered unresolved custom op: Convolution2DTransposeBias

release="3aa40c3ce9d16eae296f086bc4ac4d62deb2affc" # --> "v2.6.1"

echo '#! /bin/bash

printf "y\n"|android update sdk --no-ui -a --filter tools,platform-tools,android-${ANDROID_API_LEVEL},build-tools-${ANDROID_BUILD_TOOLS_VERSION}

cd tensorflow_src/

git fetch origin
git checkout "'"$release"'"

printf "\n\n\n\n\n\ny\n"|./configure

cp -av /script/src/* ./tensorflow/lite/kernels/
git status

bash -x tensorflow/lite/tools/build_aar.sh \
--target_archs=x86,x86_64,arm64-v8a,armeabi-v7a

bazel build -c opt --cxxopt=--std=c++14 --config=monolithic \
--fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \
--host_crosstool_top=@bazel_tools//tools/cpp:toolchain //tensorflow/lite/java:tensorflow-lite-gpu

ls -hal bazel-bin/tensorflow/lite/java/*.aar
cp -av bazel-bin/tensorflow/lite/java/*.aar /artefacts/

chmod a+rwx -R /workspace/
chmod a+rwx -R /artefacts/

' > $_HOME_/script/do_it___external.sh

chmod a+rx $_HOME_/script/do_it___external.sh
cp -a $_HOME_/src $_HOME_/script/


cd $_HOME_/
docker run -ti --rm \
  -v $_HOME_/artefacts:/artefacts \
  -v $_HOME_/script:/script \
  -v $_HOME_/workspace:/workspace \
  -e DISPLAY=$DISPLAY \
  tflite-builder \
  /bin/bash /script/do_it___external.sh


