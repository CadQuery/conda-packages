cmake -G "Visual Studio 16 2019" -B build ^
      -D CMAKE_BUILD_TYPE:STRING="Release" ^
      -D CMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
      -D Python_FIND_VIRTUALENV=ONLY ^
      -D NG_INSTALL_DIR_INCLUDE:FILEPATH="%LIBRARY_PREFIX%/include/netgen" ^
      -D NG_INSTALL_DIR_PYTHON:FILEPATH="%SP_DIR%" ^
      -D OCC_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%/include/opencascade" ^
      -D OCC_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%/lib" ^
      -D USE_OCC:BOOL=ON ^
      -D USE_PYTHON:BOOL=ON ^
      -D USE_GUI:BOOL=OFF ^
      -D BUILD_FOR_CONDA:BOOL=ON ^
      -D USE_SUPERBUILD:BOOL=OFF ^
      -D USE_NATIVE_ARCH:BOOL=OFF ^
      -D PREFER_SYSTEM_PYBIND11=ON ^
      -D BUILD_STUB_FILES:BOOL=OFF

if errorlevel 1 exit 1

cmake --build build --target install
if errorlevel 1 exit 1
