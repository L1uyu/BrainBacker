#pragma once

#include <memory>
#include "window.h"
#include "Core/gpu_context.h"
#include "Resources/resource_manager.h"

namespace LightChef
{

    class Application
    {
    public:
        Application();
        virtual ~Application();

        Application(const Application&) = delete;
        Application& operator=(const Application&) = delete;

        virtual bool Initialize();
        virtual void MainLoop();
        virtual void Terminate();
    protected:
        Window m_window;
        GPUContext m_gpuContext;
    };

}
