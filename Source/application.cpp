#include "App/application.h"

using namespace LightChef;

bool Application::Initialize()
{
    m_window.CreateWindow("LightChef", 640, 480);
    m_gpuContext.CreateInstance();
    m_window.InitSurface(m_gpuContext);
    return true;
}