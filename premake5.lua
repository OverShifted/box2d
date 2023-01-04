project "box2d"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.cpp",
		"src/**.h",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"src"
	}

	filter "system:linux"
		pic "on"
		systemversion "latest"
		staticruntime "on"

	filter "system:windows"
		systemversion "latest"
		staticruntime (staticRuntime)

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:DebugOptimized"
		runtime "Debug"
		symbols "on"
		optimize "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
