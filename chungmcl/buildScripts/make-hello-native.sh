clear
#
source ../source.sh
#
# force download of latest runtime source from whatever
# you specified in: 
# keystone/sdk/examples/hello-native/CMakeLists.txt
# keystone/sdk/macros.cmake
rm -rf examples/hello-native/runtime
#
cmake ..
#
make
#
make hello-native-package
#
# cp -R examples/hello-native ./overlay/root
cp examples/hello-native/hello-native.ke ./overlay/root
#
make image
