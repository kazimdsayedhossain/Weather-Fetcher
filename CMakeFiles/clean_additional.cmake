# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\appweather_app_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appweather_app_autogen.dir\\ParseCache.txt"
  "appweather_app_autogen"
  )
endif()
