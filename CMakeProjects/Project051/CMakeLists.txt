cmake_minimum_required(VERSION 3.10)
project(Project051 LANGUAGES CXX)

# Libraries and Exe
add_library(Project051_lib lib.cpp)
add_executable(Project051 main.cpp)

target_link_libraries(Project051 PRIVATE Project051_lib)

# Compiler Args
target_compile_options(Project051 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project051_lib PUBLIC                     
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
target_precompile_headers(Project051_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project051_lib PUBLIC cxx_std_23)
target_compile_features(Project051 PUBLIC cxx_std_23)
    
# Define modules for Project051_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project051_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project051 PRIVATE ../Project102)
target_link_libraries(Project051_lib PUBLIC Project102_lib)

#Right Node Dependency
target_include_directories(Project051 PRIVATE ../Project103)
target_link_libraries(Project051_lib PUBLIC Project103_lib)

