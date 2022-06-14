clear
#
source ../source.sh
# reinstall the SDK (this must be run if you modify anything in keystone/sdk)
cd ..
export KEYSTONE_SDK_DIR=$(pwd)/sdk/build$BITS
cd sdk
mkdir -p build
cd build
cmake .. $SDK_FLAGS
make
make install
cd ..
cd build64
rm -rf cmake
rm -rf include
rm -rf lib
cd ..
cp -r build/cmake build64/cmake
cp -r build/include build64/include
cp -r build/lib build64/lib
cd ..
# return to keystone/build
cd build
#
# force download of latest runtime source from whatever
# you specified in: 
# keystone/sdk/examples/hello-native/CMakeLists.txt
# keystone/sdk/macros.cmake
rm -rf examples/timing-test/runtime
#
cmake ..
#
make
#
make timing-test-package
#
# cp -R examples/timing-test ./overlay/root
cp examples/timing-test/timing-test.ke ./overlay/root
#
make image
