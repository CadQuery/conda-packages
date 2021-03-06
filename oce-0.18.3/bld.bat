mkdir build
cd build
dir "%LIBRARY_PREFIX%"\include\
REM Configure step

set CC=cl.exe
set CXX=cl.exe

cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
 -DCMAKE_BUILD_TYPE=RelWithDebInfo ^
 -DOCE_NO_LIBRARY_VERSION=ON ^
 -DOCE_TESTING=OFF ^
 -DOCE_USE_PCH=OFF ^
 -DOCE_COPY_HEADERS_BUILD=ON ^
 -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_SYSTEM_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DOCE_INSTALL_LIB_DIR=lib ^
 -DOCE_INSTALL_BIN_DIR=bin ^
 -DOCE_WITH_FREEIMAGE=ON ^
 -DFREEIMAGE_INCLUDE_DIR="%LIBRARY_PREFIX%"\include\FreeImage ^
 -DOCE_WITH_GL2PS=OFF ^
 -DGL2PS_INCLUDE_DIR="%LIBRARY_PREFIX%"\include\gl2ps ^
 -DOCE_MULTITHREAD_LIBRARY=TBB ^
 -DOCE_INSTALL_PREFIX="%LIBRARY_PREFIX%" -DOCE_ENABLE_DEB_FLAG=OFF ..
if errorlevel 1 exit 1
 
REM Build step 
ninja 
:: > build_files.txt
if errorlevel 1 exit 1

REM Install step
ninja install > installed_files.txt
if errorlevel 1 exit 1

REM Fix hardcoded absolute freetype paths
python %RECIPE_DIR%\fixpaths.py "%LIBRARY_PREFIX%\cmake\OCE-libraries-relwithdebinfo.cmake" "%LIBRARY_PREFIX%"\lib\
if errorlevel 1 exit 1
