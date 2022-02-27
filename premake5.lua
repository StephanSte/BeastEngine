workspace "Beast"
    architecture "x64"
    startproject "Sandbox"
    configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Beast"
    location "Beast"
    kind "SharedLib"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files { "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
    }

    includedirs {
        "%{prj.name}/vendor/spdlog/include"
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
    
