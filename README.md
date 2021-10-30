### tensorflow-lite for Android with OPS for selfiesegmentation_mlkit-256x256-2021_01_19-v1215.f16.tflite

thanks to this blog: https://zenn.dev/pinto0309/articles/a0e40c2817f2ee
it shows pretty much all you need to compile it for android with ```Convolution2DTransposeBias``` needed for the model
selfiesegmentation_mlkit-256x256-2021_01_19-v1215.f16.tflite

This Build contains tflite with custom ops from Mediapipe.<br><br>

* Tensorflow lite source used: https://github.com/tensorflow/tensorflow
* read more about Selfie Segmentation: https://developers.google.com/ml-kit/vision/selfie-segmentation
* Mediapipe source files for custom OPS copied from:  https://github.com/google/mediapipe/blob/1faeaae7e504657f44544989f9547fc69652e487/mediapipe/util/tflite/operations/
* read more about the used model: https://developers.google.com/ml-kit/images/vision/selfie-segmentation/selfie-model-card.pdf
* just in case the above file should be removed, here is a copy of it: https://github.com/zoff99/tensorflow-lite-addons_compile/blob/main/docs/selfie-model-card.pdf
* Model Data: https://github.com/zoff99/backscrub/blob/main/models/selfiesegmentation_mlkit-256x256-2021_01_19-v1215.f16.tflite
