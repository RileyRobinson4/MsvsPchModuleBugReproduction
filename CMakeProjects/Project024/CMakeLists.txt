cmake_minimum_required(VERSION 3.10)
project(Project024 LANGUAGES CXX)

# Libraries and Exe
add_library(Project024_lib lib.cpp)
add_executable(Project024 main.cpp)

target_link_libraries(Project024 PRIVATE Project024_lib)

# Compiler Args
target_compile_options(Project024 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project024_lib PUBLIC                     
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
target_precompile_headers(Project024_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project024_lib PUBLIC cxx_std_23)
target_compile_features(Project024 PUBLIC cxx_std_23)
    
# Define modules for Project024_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project024_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project024 PRIVATE ../Project048)
target_link_libraries(Project024_lib PUBLIC Project048_lib)

#Right Node Dependency
target_include_directories(Project024 PRIVATE ../Project049)
target_link_libraries(Project024_lib PUBLIC Project049_lib)

