#pragma once
#include <webgpu/webgpu.hpp>
#include <glfw3webgpu.h>
namespace LightChef
{
    class Renderer
    {
    public:
        void Initialize(GLFWwindow* window);
        void Render();
    private:
        void InitializePipeline();
        void InitializeBuffers();
        void InitializeBindGroups();

        wgpu::Instance m_instance;
        wgpu::Adapter m_adapter;
        wgpu::Surface m_surface;
        wgpu::Device m_device;
        wgpu::Queue m_queue;
        wgpu::RenderPipeline m_pipeline;
        wgpu::Buffer m_pointBuffer;
        wgpu::Buffer m_indexBuffer;
        wgpu::Buffer m_uniformBuffer;
        wgpu::BindGroup m_bindGroup;
        wgpu::BindGroupLayout m_bindGroupLayout;
        wgpu::PipelineLayout m_pipelineLayout;
        wgpu::SurfaceCapabilities m_surfaceCapabilities;
    };
}