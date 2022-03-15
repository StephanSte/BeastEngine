#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Beast{
	class BEAST_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log macros
#define BT_CORE_TRACE(...)   ::Beast::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define BT_CORE_INFO(...)    ::Beast::Log::GetCoreLogger()->info(__VA_ARGS__)
#define BT_CORE_WARN(...)    ::Beast::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define BT_CORE_ERROR(...)   ::Beast::Log::GetCoreLogger()->error(__VA_ARGS__)
#define BT_CORE_FATAL(...)   ::Beast::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client Log macros
#define BT_APP_TRACE(...)        ::Beast::Log::GetClientLogger()->trace(__VA_ARGS__)
#define BT_APP_INFO(...)         ::Beast::Log::GetClientLogger()->info(__VA_ARGS__)
#define BT_APP_WARN(...)         ::Beast::Log::GetClientLogger()->warn(__VA_ARGS__)
#define BT_APP_ERROR(...)        ::Beast::Log::GetClientLogger()->error(__VA_ARGS__)
#define BT_APP_FATAL(...)        ::Beast::Log::GetClientLogger()->fatal(__VA_ARGS__)
