#include "App/window.h"

using namespace LightChef;

GLFWwindow* Window::GetHandle()
{
    return m_window;
}

void Window::CreateWindow(const std::string& title, int width, int height)
{
    glfwInit();
	glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
	glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
    m_window = glfwCreateWindow(width, height, title.c_str(), nullptr, nullptr);
}

wgpu::Surface Window::GetSurface(wgpu::Instance instance)
{
    wgpu::Surface surface = glfwGetWGPUSurface(instance, m_window);
    return surface;
}
