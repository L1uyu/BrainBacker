cmake_minimum_required( VERSION 3.5 )
project(
	BakerBrain
	VERSION 0.1.0
	LANGUAGES CXX C
)
include(utils.cmake)
add_subdirectory(glfw)
add_subdirectory(webgpu)
add_subdirectory(glfw3webgpu)
add_executable(Baker
	main.cpp
	webgpu-utils.h
	webgpu-utils.cpp
)
target_link_libraries(Baker PRIVATE glfw webgpu glfw3webgpu)
target_copy_webgpu_binaries(Baker)
# 设定编译参数
set_target_properties(Baker PROPERTIES CXX_STANDARD 17)  # 指定 C++ 版本
target_treat_all_warnings_as_errors(Baker)