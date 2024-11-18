cmake_minimum_required( VERSION 3.20 )

set(ENV{http_proxy} "http://127.0.0.1:7890")
set(ENV{https_proxy} "http://127.0.0.1:7890")
project(
	LightChef
	VERSION 0.1.1
	LANGUAGES CXX C
)
set(CMAKE_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/CMake")
include("${CMAKE_INCLUDE_DIR}/utils.cmake")

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(DEV_MODE ON CACHE BOOL "Set up development helper settings" FORCE)
else()
    set(DEV_MODE OFF CACHE BOOL "" FORCE)
endif()

add_subdirectory(External/glfw)
add_subdirectory(External/webgpu)
add_subdirectory(External/glfw3webgpu)
add_subdirectory(External/bvh)
include_directories(include)

add_executable(Baker
	Source/main.cpp
)

if(DEV_MODE)
	# In dev mode, we load resources from the source tree, so that when we
	# dynamically edit resources (like shaders), these are correctly
	# versionned.
	target_compile_definitions(Baker PRIVATE
		RESOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/Resources"
	)
else()
	# In release mode, we just load resources relatively to wherever the
	# executable is launched from, so that the binary is portable
	target_compile_definitions(Baker PRIVATE
		RESOURCE_DIR="./Resources"
	)
endif()

target_include_directories(Baker PRIVATE External)
target_link_libraries(Baker PRIVATE glfw webgpu glfw3webgpu bvh)
target_copy_webgpu_binaries(Baker)

set_target_properties(Baker PROPERTIES CXX_STANDARD 20)
target_treat_all_warnings_as_errors(Baker)

if (MSVC)
	# Disable warning C4201: nonstandard extension used: nameless struct/union
	target_compile_options(Baker PUBLIC /wd4201)
endif (MSVC)