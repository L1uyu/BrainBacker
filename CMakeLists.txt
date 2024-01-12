cmake_minimum_required( VERSION 3.5 )
project(
	BakerBrain
	VERSION 0.1.0
	LANGUAGES CXX C
)
include(utils.cmake)
option(DEV_MODE "Set up development helper settings" ON)
add_subdirectory(glfw)
add_subdirectory(webgpu)
add_subdirectory(glfw3webgpu)
add_executable(Baker
	main.cpp
	magic_enum.hpp
)
if(DEV_MODE)
	# In dev mode, we load resources from the source tree, so that when we
	# dynamically edit resources (like shaders), these are correctly
	# versionned.
	target_compile_definitions(Baker PRIVATE
		RESOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/resources"
	)
else()
	# In release mode, we just load resources relatively to wherever the
	# executable is launched from, so that the binary is portable
	target_compile_definitions(Baker PRIVATE
		RESOURCE_DIR="./resources"
	)
endif()
target_link_libraries(Baker PRIVATE glfw webgpu glfw3webgpu)
target_copy_webgpu_binaries(Baker)
# 设定编译参数
set_target_properties(Baker PROPERTIES CXX_STANDARD 17)  # 指定 C++ 版本
target_treat_all_warnings_as_errors(Baker)