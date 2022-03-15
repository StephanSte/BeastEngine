#pragma once

#include "Core.h";
#include "Events/Event.h"

namespace Beast {
	//to use inside sandbox export is needed
	class BEAST_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	//to be defined in client
	Application* CreateApplication();

}


