#pragma once
#include <webgpu/webgpu.hpp>
namespace LightChef
{
    class GPUContext
    {
    public:
        wgpu::Instance& GetInstance();
        wgpu::Adapter& GetAdapter(); 
        wgpu::Surface& GetSurface();
        wgpu::Device& GetDevice();
        wgpu::Queue& GetQueue();
    private:
        wgpu::Instance m_instance;
        wgpu::Adapter m_adapter;
        wgpu::Surface m_surface;
        wgpu::Device m_device;
        wgpu::Queue m_queue;
    };
}