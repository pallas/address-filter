cmake_minimum_required(VERSION 3.1)

set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
	set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
		STRING "Choose the type of build." FORCE)
	set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
		"Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

project(AddressFilter)
add_executable(address-filter address-filter.cc)

install(TARGETS address-filter
	RUNTIME DESTINATION bin
	)

enable_testing()
add_test(NAME basic COMMAND sh -c "
	cat ${CMAKE_SOURCE_DIR}/test.in |
	$<TARGET_FILE:address-filter> |
	tee ${CMAKE_SOURCE_DIR}/test.got |
	diff - ${CMAKE_SOURCE_DIR}/test.out
")
