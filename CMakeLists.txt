include(cice_files.cmake)

set(libName "cice")
set(moduleDir "${CMAKE_CURRENT_BINARY_DIR}/include/${libName}")
# These options will help CMake gather the correct files for the library
# BOOLEAN OPTIONS (Default values here are ON or OFF)
option(USE_MPI "Use MPI Libraries" ON)
option(USE_NETCDF "Use NetCDF IO Libraries" ON)
option(USE_PIO2 "Use PIO2 IO Libraries" OFF)
# VARIABLE OPTIONS (Default options here are the first listed in 'set_property')
set(USE_DRIVER CACHE STRING "Driver to use for CICE6: standalone nuopc direct mct")
set(NUOPC_TARGET CACHE STRING "Which NUOPC implementation: cmeps, dmi")
set_property(CACHE USE_DRIVER PROPERTY STRINGS standalone nuopc direct mct)
set_property(CACHE NUOPC_TARGET PROPERTY STRINGS cmeps dmi)
# NUOPC_TARGET is needed is nuopc driver is selected.
if(USE_DRIVER STREQUAL nuopc AND NOT NUOPC_TARGET)
  message(FATAL_ERROR "Please Set -DNUOPC_TARGET=<cmeps/dmi> if you are using -DUSE_DRIVER=nuopc")
endif()



# If we want to build with MPI there's one set of files, or serial another set (files are named the same)
if(USE_MPI)
  message(STATUS "Using MPI")
  set(comm_list ${mpi_comm_files})
else()
  message(STATUS "Using Serial")
  set(comm_list ${serial_comm_files})
endif()

# Which IO do we want to use NetCDF, PIO2 or just binary (default)
if(USE_NETCDF AND USE_PIO2)
  message(FATAL_ERROR "You cannot choose both NETCDF I/O and PIO2 I/O")
endif()
if(USE_PIO2)
  message(STATUS "Using PIO2 IO")
  set(io_list ${pio2_io_files})
elseif(USE_NETCDF)
  message(STATUS "Using NetCDF IO")
  set(io_list ${netcdf_io_files})
else()
  message(STATUS "Using binary IO")
  set(io_list ${binary_io_files})
endif()

# There are multiple drivers in the drivers area. This will grab the files for the chosen driver.
if(USE_DRIVER STREQUAL "nuopc")
  if(NUOPC_TARGET STREQUAL "cmeps")
    message(STATUS "Using NUOPC CMEPS driver")
    set(driver_list ${nuopc_cmeps_driver_files})
  endif()
  if(NUOPC_TARGET STREQUAL "dmi")
    message(STATUS "Using NUOPC DMI driver")
    set(driver_list ${nuopc_dmi_driver_files})
  endif()
elseif(USE_DRIVER STREQUAL "direct")
  message(STATUS "Using direct driver")
  set(driver_list ${direct_driver_files})
elseif(USE_DRIVER STREQUAL "mct")
  message(STATUS "Using MCT driver")
  set(driver_list ${mct_driver_files})
else() #USE STANDALONE
  message(STATUS "Using standalone driver")
  set(driver_list ${standalone_driver_files})
endif()

# Merge all the lists together for the library
LIST(APPEND library_file_list
  ${cice_shared_files}
  ${comm_list}
  ${io_list}
  ${driver_list}
)
message("LIBRARY FILES LIST: ${library_file_list}")
# Shows list to help see if something may be missing from the list, purely debug option
# message(STATUS "FILE LIST: ${library_file_list}")

add_library(${libName} STATIC ${library_file_list})
add_library(${libName}::${libName} ALIAS ${libName})

set_target_properties(${libName} PROPERTIES Fortran_MODULE_DIRECTORY
                                            ${moduleDir})
set_target_properties(${libName} PROPERTIES C_MODULE_DIRECTORY
                                            ${moduleDir})

target_link_libraries(${libName} PUBLIC NetCDF::NetCDF_Fortran
                                      NetCDF:NetCDF_C)

target_include_directories(${libName} INTERFACE
  $<BUILD_INTERFACE:${moduleDir}>
  $<INSTALL_INTERFACE:include/cice>)

if(OpenMP_Fortran_FOUND)
  target_link_libraries(${libName} PUBLIC OpenMP::OpenMP_Fortran
                                          OpenMP::OpenMP_C)
endif()

# Install compiled Fortran modules
message("CMAKE INSTALL INCLUDEDIR: ${CMAKE_INSTALL_INCLUDEDIR}")
install(DIRECTORY ${moduleDir} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# This tells CMake where to put things in the case of 'make install' (currently untested)
install(
  TARGETS cice
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  COMPONENT Library)
