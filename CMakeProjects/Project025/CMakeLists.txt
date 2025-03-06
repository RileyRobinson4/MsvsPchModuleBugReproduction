cmake_minimum_required(VERSION 3.10)
project(Project025 LANGUAGES CXX)

# Libraries and Exe
add_library(Project025_lib lib.cpp)
add_executable(Project025 main.cpp)

target_link_libraries(Project025 PRIVATE Project025_lib)

# Compiler Args
target_compile_options(Project025 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project025_lib PUBLIC                     
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
target_precompile_headers(Project025_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project025_lib PUBLIC cxx_std_23)
target_compile_features(Project025 PUBLIC cxx_std_23)
    
# Define modules for Project025_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project025_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project025 PRIVATE ../Project050)
target_link_libraries(Project025_lib PUBLIC Project050_lib)

#Right Node Dependency
target_include_directories(Project025 PRIVATE ../Project051)
target_link_libraries(Project025_lib PUBLIC Project051_lib)

