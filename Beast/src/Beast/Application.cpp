#include "Application.h";

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace Beast {

	Application::Application() {

	}

	Application::~Application() {

	}

	void Application::Run() {

		WindowResizeEvent e(1200, 700);
		BT_CORE_TRACE(e);
		while (true);
	}
}
