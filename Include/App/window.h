#pragma once
#include <GLFW/glfw3.h>
#include <glfw3webgpu.h>
#include <webgpu/webgpu.hpp>
#include <string>
namespace LightChef
{
    class Window
    {
    public:
        GLFWwindow* GetHandle();
        void CreateWindow(const std::string& title, int width, int height);
        wgpu::Surface GetSurface(wgpu::Instance instance); 
    private:
        GLFWwindow* m_window;
    };
}