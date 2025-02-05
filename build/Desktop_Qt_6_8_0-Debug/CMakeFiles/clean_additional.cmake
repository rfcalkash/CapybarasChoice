# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appCapybarasChoice_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appCapybarasChoice_autogen.dir/ParseCache.txt"
  "appCapybarasChoice_autogen"
  )
endif()
