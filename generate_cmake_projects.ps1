# Base directory
$baseDir = "CMakeProjects"
New-Item -Path $baseDir -ItemType Directory -Force | Out-Null

$numProjects = 128

# Root CMakeLists.txt
$rootCMake = @"
cmake_minimum_required(VERSION 3.10)
project(CMakeProjectChain LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


"@
for ($i = 1; $i -le $numProjects; $i++) {
    $projName = "Project{0:D3}" -f $i
    $rootCMake += "add_subdirectory($projName)`n"
}
Set-Content -Path (Join-Path $baseDir "CMakeLists.txt") -Value $rootCMake

# Generate each project
for ($i = 1; $i -le $numProjects; $i++) {
    $projName = "Project{0:D3}" -f $i
    $projDir = Join-Path $baseDir $projName
    New-Item -Path $projDir -ItemType Directory -Force | Out-Null

    # pch.h
    $pchHContent = @"
#pragma once
#include <iostream>

namespace $projName {
    void run();
}
"@

    # pch.cpp
    $pchCppContent = @"
#include "pch.h"
"@

    # lib.cpp
    $libCppContent = @"
#include "pch.h"
import $projName;`n
"@
    $left = ($i * 2)
    $right = ($i * 2 + 1)
    if($left -le $numProjects)
    {
        $leftProj = "Project{0:D3}" -f $left
        $libCppContent += "#include `"../$leftProj/pch.h`"`n"
    }
    else {
        $leftProj = ""
    }
    
    if($right -le $numProjects)
    {
        $rightProj = "Project{0:D3}" -f $right
        $libCppContent += "#include `"../$rightProj/pch.h`"`n"
    }
    else {
        $rightProj = ""
    }

    $libCppContent += @"
    namespace $projName {
        void run() {
            std::cout << $projName::printString << std::endl;`n
"@

    if($left -lt $numProjects)
    {
        $libCppContent += "            ${leftProj}::run();`n"
    }
    if($right -lt $numProjects)
    {
        $libCppContent += "            ${rightProj}::run();`n"
    }
    $libCppContent += @"
    }
}
"@

    # main.cpp
$mainCppContent = @"
#include "pch.h"
//Includes to increase compilation time.
#include <string>
#include <functional>
#include <memory>
#include <iostream>
#include <vector>
#include <complex>`n
"@
    $mainCppContent += "#include `"pch.h`"`n"
    
$mainCppContent += @"

int main() {
    $projName::run();
    return 0;
}
"@

# module.cppm
$moduleContent = @"
module;

#include <string>`n
"@

$moduleContent += "export module $projName;`n"
$moduleContent += @"
export namespace $projName
{
    std::string printString = `"Running $projName`";
};
"@
        
    Set-Content -Path (Join-Path $projDir "pch.h") -Value $pchHContent
    Set-Content -Path (Join-Path $projDir "pch.cpp") -Value $pchCppContent
    Set-Content -Path (Join-Path $projDir "lib.cpp") -Value $libCppContent
    Set-Content -Path (Join-Path $projDir "main.cpp") -Value $mainCppContent
    Set-Content -Path (Join-Path $projDir "module.cppm") -Value $moduleContent

    # CMakeLists.txt
    $cmakeContent = @"
cmake_minimum_required(VERSION 3.10)
project($projName LANGUAGES CXX)

# Libraries and Exe
add_library(${projName}_lib lib.cpp)
add_executable(${projName} main.cpp)

target_link_libraries($projName PRIVATE ${projName}_lib)

# Compiler Args
target_compile_options($projName PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(${projName}_lib PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

# PCH
target_precompile_headers(${projName}_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(${projName}_lib PUBLIC cxx_std_23)
target_compile_features(${projName} PUBLIC cxx_std_23)
    
# Define modules for ${projName}_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE `${CMAKE_CURRENT_SOURCE_DIR} PREFIX `"source`" FILES `${MODULE_SOURCE_LIST})
target_sources(${projName}_lib PUBLIC FILE_SET CXX_MODULES FILES `${MODULE_SOURCE_LIST})

"@

    if($left -le $numProjects)
    {
        $cmakeContent += "`n#Left Node Dependency`n"
        $cmakeContent += "target_include_directories($projName PRIVATE ../$leftProj)`n"
        $cmakeContent += "target_link_libraries(${projName}_lib PUBLIC ${leftProj}_lib)`n"
    }
    if($right -le $numProjects)
    {
        $cmakeContent += "`n#Right Node Dependency`n"
        $cmakeContent += "target_include_directories($projName PRIVATE ../$rightProj)`n"
        $cmakeContent += "target_link_libraries(${projName}_lib PUBLIC ${rightProj}_lib)`n"
    }

    Set-Content -Path (Join-Path $projDir "CMakeLists.txt") -Value $cmakeContent
}

Write-Host "Generated $numProjects CMake projects in '$baseDir' directory."