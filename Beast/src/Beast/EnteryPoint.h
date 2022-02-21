#pragma once

#ifdef HZ_PLATFORM_WINDOWS

extern Beast::Application* Beast::CreateApplication();

int main(int argc, char** argv) {
	printf("Hallo");
	auto app = Beast::CreateApplication();
	app->Run();
	delete app;
}

#endif // HZ_PLATFORM_WINDOWS
