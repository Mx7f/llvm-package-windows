::@echo off

:: . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .


:: Download LLVM
powershell.exe -File ./download.ps1 "%LLVM_DOWNLOAD_URL%" "%APPVEYOR_BUILD_FOLDER%/%LLVM_DOWNLOAD_FILE%"
7z x -y %APPVEYOR_BUILD_FOLDER%\%LLVM_DOWNLOAD_FILE% -o%APPVEYOR_BUILD_FOLDER%
7z x -y %APPVEYOR_BUILD_FOLDER%\llvm-%LLVM_VERSION%.src.tar -o%APPVEYOR_BUILD_FOLDER%
ren "%APPVEYOR_BUILD_FOLDER%\llvm-%LLVM_VERSION%.src" "../llvm"

powershell.exe -File ./download.ps1 "%CLANG_DOWNLOAD_URL%" "%APPVEYOR_BUILD_FOLDER%/%CLANG_DOWNLOAD_FILE%"
7z x -y %APPVEYOR_BUILD_FOLDER%\%CLANG_DOWNLOAD_FILE% -o%APPVEYOR_BUILD_FOLDER%
7z x -y %APPVEYOR_BUILD_FOLDER%\cfe-%LLVM_VERSION%.src.tar -o%APPVEYOR_BUILD_FOLDER%
move "%APPVEYOR_BUILD_FOLDER%/cfe-%LLVM_VERSION%.src" "llvm/tools/clang"

:: . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

:: Get rid of Xamarin annoying build warnings

:: del "c:\Program Files (x86)\MSBuild\14.0\Microsoft.Common.targets\ImportAfter\Xamarin.Common.targets"
:: del "c:\Program Files (x86)\MSBuild\4.0\Microsoft.Common.Targets\ImportAfter\Xamarin.Common.targets"
