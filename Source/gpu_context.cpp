#include "Core/gpu_context.h"

namespace LightChef
{
    wgpu::Instance GPUContext::CreateInstance()
    {
        if (!m_instance)
        {
            m_instance = wgpuCreateInstance(nullptr);
        }
        return m_instance;
    }
    wgpu::Instance GPUContext::GetInstance()
    {
        return m_instance;
    }

    wgpu::Adapter GPUContext::GetAdapter()
    {
        return m_adapter;
    }

    wgpu::Surface GPUContext::GetSurface() 
    {
        return m_surface;
    }

    wgpu::Device GPUContext::GetDevice()
    {
        return m_device;
    }

    wgpu::Queue GPUContext::GetQueue()
    {
        return m_queue;
    }

    void GPUContext::SetSurface(wgpu::Surface surface)
    {
        m_surface = surface;
    }
}