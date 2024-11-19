#pragma once

#include <memory>
#include "window.h"
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

        virtual void Initialize();
        virtual void MainLoop();
        virtual void Terminate();
    protected:
    
    };

}
