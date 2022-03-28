#pragma once

#ifdef BT_PLATFORM_WINDOWS
	#ifdef BEAST_BUILD_DLL
		#define BEAST_API __declspec(dllexport)
	#else 
		#define BEAST_API __declspec(dllimport)
	#endif
#else
	#error Beast only supports windows!
#endif

#ifdef BT_ENABLE_ASSERTS
	#define BT_ASSERT(x, ...) { if(!(x)) { HE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define BT_CORE_ASSERT(x, ...) { if(!(x)) {HE_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define BT_ASSERT(x, ...)
	#define BT_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)