workspace "Beast"
    architecture "x64"
    startproject "Sandbox"
    configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Beast/vendor/GLFW/include"

include "Beast/vendor/GLFW"

project "Beast"
    location "Beast"
    kind "SharedLib"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "bepch.h"
	pchsource "Beast/src/bepch.cpp"

	staticruntime "off"
	runtime "Release"
	buildoptions {"/MD"}

    files { "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
    }

    includedirs {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
    }

    links {
		"GLFW",
		"opengl32.lib"
	}

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"
        defines { "BT_PLATFORM_WINDOWS", 
                  "BEAST_BUILD_DLL" 
        }

       postbuildcommands {
        ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
       }
    
    filter "configurations:Debug" 
        defines "BT_DEBUG"
        symbols "On"
    

    filter "configurations:Release" 
        defines "BT_Release"
        optimize "On"
    

    filter "configurations:Dist" 
        defines "BT_Dist"
        optimize "On"
    


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    staticruntime "off"
	runtime "Release"
	buildoptions {"/MD"}

    files { "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
    }

    includedirs {
        "Beast/vendor/spdlog/include",
        "Beast/src"
    }

    links {
        "Beast"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"
        defines { "BT_PLATFORM_WINDOWS" }


    
    filter "configurations:Debug" 
        defines "BT_DEBUG"
        symbols "On"
    

    filter "configurations:Release" 
        defines "BT_Release"
        optimize "On"
    

    filter "configurations:Dist" 
        defines "BT_Dist"
        optimize "On"
    
