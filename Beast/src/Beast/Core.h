#pragma once

#ifdef HZ_PLATFORM_WINDOWS
	#ifdef BEAST_BUILD_DLL
		#define BEAST_API __declspec(dllexport)
	#else 
		#define BEAST_API __declspec(dllimport)
	#endif
#else
	#error Beast only supports windows!
#endif