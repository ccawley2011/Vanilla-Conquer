function(generate_riscos_package target)
	cmake_parse_arguments(
		RISCOS
		""             # Boolean args
		"APP_NAME"     # List of single-value args
		""             # Multi-valued args
		${ARGN})

	if(NOT RISCOS_APP_NAME OR "${RISCOS_APP_NAME}" STREQUAL "")
		set(RISCOS_APP_NAME "VanillaConquer")
	endif()

	set(RISCOS_APP_PATH "${CMAKE_BINARY_DIR}/!${RISCOS_APP_NAME}")

	# TODO: Add Castle variables?

	file(MAKE_DIRECTORY ${RISCOS_APP_PATH})

	add_custom_command(OUTPUT ${RISCOS_APP_PATH}/!RunImage,ff8
	                   COMMAND elf2aif $<TARGET_FILE:${target}> ${RISCOS_APP_PATH}/!RunImage,ff8
	                   DEPENDS ${target})
	add_custom_target(${target}-aif ALL DEPENDS ${RISCOS_APP_PATH}/!RunImage,ff8)
endfunction()
