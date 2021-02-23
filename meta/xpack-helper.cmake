#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2021 Liviu Ionescu
#
# This Source Code Form is subject to the terms of the MIT License.
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/MIT/.
#
# -----------------------------------------------------------------------------

if(micro-os-plus-libs-cpp-included)
  return()
endif()

set(micro-os-plus-libs-cpp-included TRUE)

message(STATUS "Including micro-os-plus-libs-cpp...")

# -----------------------------------------------------------------------------

function(add_libraries_micro_os_plus_libs_cpp)

  get_filename_component(xpack_current_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)

  # ---------------------------------------------------------------------------

  find_package(micro-os-plus-diag-trace)

  # ---------------------------------------------------------------------------

  if(NOT TARGET micro-os-plus-libs-cpp-interface)

    add_library(micro-os-plus-libs-cpp-interface INTERFACE EXCLUDE_FROM_ALL)

    # -------------------------------------------------------------------------

    target_sources(
      micro-os-plus-libs-cpp-interface
  
      INTERFACE
        ${xpack_current_folder}/src/cxx.cpp
        ${xpack_current_folder}/src/system-error.cpp
    )

    target_include_directories(
      micro-os-plus-libs-cpp-interface
  
      INTERFACE
        ${xpack_current_folder}/include
    )

    target_link_libraries(
      micro-os-plus-libs-cpp-interface
      
      INTERFACE
        micro-os-plus::diag-trace-static
    )

    # -------------------------------------------------------------------------
    # Aliases

    add_library(micro-os-plus::libs-cpp ALIAS micro-os-plus-libs-cpp-interface)
    message(STATUS "micro-os-plus::libs-cpp")

  endif()

  # ---------------------------------------------------------------------------

endfunction()

# -----------------------------------------------------------------------------
