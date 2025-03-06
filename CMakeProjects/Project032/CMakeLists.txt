cmake_minimum_required(VERSION 3.10)
project(Project032 LANGUAGES CXX)

# Libraries and Exe
add_library(Project032_lib lib.cpp)
add_executable(Project032 main.cpp)

target_link_libraries(Project032 PRIVATE Project032_lib)

# Compiler Args
target_compile_options(Project032 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project032_lib PUBLIC                     
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
target_precompile_headers(Project032_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project032_lib PUBLIC cxx_std_23)
target_compile_features(Project032 PUBLIC cxx_std_23)
    
# Define modules for Project032_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project032_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project032 PRIVATE ../Project064)
target_link_libraries(Project032_lib PUBLIC Project064_lib)

#Right Node Dependency
target_include_directories(Project032 PRIVATE ../Project065)
target_link_libraries(Project032_lib PUBLIC Project065_lib)

