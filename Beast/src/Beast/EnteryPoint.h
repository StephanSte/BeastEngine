#pragma once

#ifdef BT_PLATFORM_WINDOWS

extern Beast::Application* Beast::CreateApplication();

int main(int argc, char** argv) {
	Beast::Log::Init();
	BT_CORE_WARN("CORE Hello");
	BT_APP_INFO("APP Hello");

	printf("Hallo");
	auto app = Beast::CreateApplication();
	app->Run();
	delete app;
}

#endif // BT_PLATFORM_WINDOWS
