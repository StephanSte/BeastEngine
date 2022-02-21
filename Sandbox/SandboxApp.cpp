#include <Beast.h>

class Sandbox: public Beast::Application
{
public:
	Sandbox(){};
	~Sandbox(){};
};

Beast::Application* Beast::CreateApplication() {
	return new Sandbox();
}