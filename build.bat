set THIS_DIR=%CD%

perl patch-add-llvm.pl llvm\cmake\modules\AddLLVM.cmake
type llvm\cmake\modules\AddLLVM.cmake

mkdir llvm\build
cd llvm\build
cmake .. %CMAKE_CONFIGURE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%
cmake --build . --target install %CMAKE_BUILD_FLAGS%

cd %THIS_DIR%

7z a -t7z %LLVM_RELEASE_FILE% %LLVM_RELEASE_NAME%