cmake_minimum_required(VERSION 3.10)
project(Project061 LANGUAGES CXX)

# Libraries and Exe
add_library(Project061_lib lib.cpp)
add_executable(Project061 main.cpp)

target_link_libraries(Project061 PRIVATE Project061_lib)

# Compiler Args
target_compile_options(Project061 PUBLIC                     
                    /FC #TODO: What is setting this to true for the .vcxprojs?
                    /Wall              # WarningLevel: EnableAllWarnings
                    /WX                # TreatWarningAsErrors: true
                    /analyze           # EnablePREfast: true
                    /external:W0       # ExternalWarningLevel: TurnOffAllWarnings
                    /analyze:external- # DisableAnalyzeExternal: true
                    /external:anglebrackets # TreatAngleIncludeAsExternal: true

                    /wd4464
                    )

target_compile_options(Project061_lib PUBLIC                     
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
target_precompile_headers(Project061_lib PUBLIC pch.h)

# Needed for module support
target_compile_features(Project061_lib PUBLIC cxx_std_23)
target_compile_features(Project061 PUBLIC cxx_std_23)
    
# Define modules for Project061_lib
file(GLOB_RECURSE MODULE_SOURCE_LIST CONFIGURE_DEPENDS module.cppm)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "source" FILES ${MODULE_SOURCE_LIST})
target_sources(Project061_lib PUBLIC FILE_SET CXX_MODULES FILES ${MODULE_SOURCE_LIST})

#Left Node Dependency
target_include_directories(Project061 PRIVATE ../Project122)
target_link_libraries(Project061_lib PUBLIC Project122_lib)

#Right Node Dependency
target_include_directories(Project061 PRIVATE ../Project123)
target_link_libraries(Project061_lib PUBLIC Project123_lib)

