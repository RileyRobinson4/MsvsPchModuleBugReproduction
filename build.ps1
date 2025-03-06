
if (-not (Test-Path -Path ".\build")) {
    New-Item -Path ".\build" -ItemType Directory -Force | Out-Null
}

Push-Location ".\build"

& "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE --no-warn-unused-cli -S../CMakeProjects -B../build -G "Visual Studio 17 2022" -T host=x64 -A x64
& "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" --build ../build --config Debug --target ALL_BUILD -j 22 --

Pop-Location