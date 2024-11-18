mkdir build
cmake . -B build -DWEBGPU_BACKEND=WGPU -DCMAKE_BUILD_TYPE=Debug
cmake --build build