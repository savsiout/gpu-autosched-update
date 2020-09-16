function(check_files_exist FAILED)
    set(${FAILED} FALSE PARENT_SCOPE)
    foreach (F IN LISTS ARGN)
        if (NOT EXISTS ${F})
            message(STATUS "File not found: ${F}")
            set(${FAILED} TRUE PARENT_SCOPE)
        endif ()
    endforeach ()
endfunction()

if (CMAKE_SCRIPT_MODE_FILE)
    check_files_exist(FAILED ${FILES_TO_CHECK})
    if (FAILED)
        message(FATAL_ERROR "One or more files weren't found")
    endif ()
endif ()
