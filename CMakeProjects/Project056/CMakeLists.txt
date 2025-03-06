cmake_minimum_required(VERSION 3.10)
project(Project056 LANGUAGES CXX)

# Libraries and Exe
add_library(Project056_lib lib.cpp)
add_executable(Project056 main.cpp)

target_link_libraries(Project056 PRIVATE Project056_lib)

# Compiler Args
target_compile_options(Project056 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project056_lib PUBLIC                     
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
target_precompile_headers(Project056_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project056_lib PUBLIC cxx_std_23)
target_compile_features(Project056 PUBLIC cxx_std_23)
    
# Define modules for Project056_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project056_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project056 PRIVATE ../Project112)
target_link_libraries(Project056_lib PUBLIC Project112_lib)

#Right Node Dependency
target_include_directories(Project056 PRIVATE ../Project113)
target_link_libraries(Project056_lib PUBLIC Project113_lib)

