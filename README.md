BeastEngine
Game Engine as per The Cherno YouTube series within the scope of the Engine Architecture and Design FHTW course. The engine compiles to a DLL.

Contains these Components:
AN Entry Point which is a simple entry point to the engine that can be accessed from an application using the engine
Logging: uses the library spdlog to give basic logging requirements and log levels
Event System: To dispatch and react to events such as resizing the window
Window Abstraction: Uses the GLFWLibrary to give a basic abstract window class that can be implemented for various Operating Systems and features the implementation of such a class for the Windows OS
Window Events: contains various window events, such the interaction with a mouse/keyboard or resize/closing of the window
