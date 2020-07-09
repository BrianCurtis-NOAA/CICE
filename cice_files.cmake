list(APPEND cice_shared_files
  #Shared List:
  cicecore/shared/ice_arrays_column.F90
  cicecore/shared/ice_calendar.F90
  cicecore/shared/ice_constants.F90
  cicecore/shared/ice_distribution.F90
  cicecore/shared/ice_domain_size.F90
  cicecore/shared/ice_fileunits.F90
  cicecore/shared/ice_init_column.F90
  cicecore/shared/ice_kinds_mod.F90
  cicecore/shared/ice_restart_column.F90
  cicecore/shared/ice_restart_shared.F90
  cicecore/shared/ice_spacecurve.F90

  #Analysis List:
  cicecore/cicedynB/analysis/ice_diagnostics.F90
  cicecore/cicedynB/analysis/ice_diagnostics_bgc.F90
  cicecore/cicedynB/analysis/ice_history.F90
  cicecore/cicedynB/analysis/ice_history_bgc.F90
  cicecore/cicedynB/analysis/ice_history_drag.F90
  cicecore/cicedynB/analysis/ice_history_fsd.F90
  cicecore/cicedynB/analysis/ice_history_mechred.F90
  cicecore/cicedynB/analysis/ice_history_pond.F90
  cicecore/cicedynB/analysis/ice_history_shared.F90

  #Dynamics List:
  cicecore/cicedynB/dynamics/ice_dyn_eap.F90
  cicecore/cicedynB/dynamics/ice_dyn_evp.F90
  cicecore/cicedynB/dynamics/ice_dyn_evp_1d.F90
  cicecore/cicedynB/dynamics/ice_dyn_shared.F90
  cicecore/cicedynB/dynamics/ice_transport_driver.F90
  cicecore/cicedynB/dynamics/ice_transport_remap.F90

  #General List:
  cicecore/cicedynB/general/ice_flux.F90
  cicecore/cicedynB/general/ice_flux_bgc.F90
  cicecore/cicedynB/general/ice_forcing.F90
  cicecore/cicedynB/general/ice_forcing_bgc.F90
  cicecore/cicedynB/general/ice_init.F90
  cicecore/cicedynB/general/ice_state.F90
  cicecore/cicedynB/general/ice_step_mod.F90

  #Infrastructure List
  cicecore/cicedynB/infrastructure/ice_blocks.F90
  cicecore/cicedynB/infrastructure/ice_domain.F90
  cicecore/cicedynB/infrastructure/ice_grid.F90
  cicecore/cicedynB/infrastructure/ice_read_write.F90
  cicecore/cicedynB/infrastructure/ice_restart_driver.F90
  cicecore/cicedynB/infrastructure/ice_restoring.F90
  cicecore/cicedynB/infrastructure/ice_shr_reprosum86.c

  #Icepack List:
  icepack/columnphysics/icepack_aerosol.F90
  icepack/columnphysics/icepack_age.F90
  icepack/columnphysics/icepack_algae.F90
  icepack/columnphysics/icepack_atmo.F90
  icepack/columnphysics/icepack_brine.F90
  icepack/columnphysics/icepack_firstyear.F90
  icepack/columnphysics/icepack_flux.F90
  icepack/columnphysics/icepack_fsd.F90
  icepack/columnphysics/icepack_intfc.F90
  icepack/columnphysics/icepack_isotope.F90
  icepack/columnphysics/icepack_itd.F90
  icepack/columnphysics/icepack_kinds.F90
  icepack/columnphysics/icepack_mechred.F90
  icepack/columnphysics/icepack_meltpond_cesm.F90
  icepack/columnphysics/icepack_meltpond_lvl.F90
  icepack/columnphysics/icepack_meltpond_topo.F90
  icepack/columnphysics/icepack_mushy_physics.F90
  icepack/columnphysics/icepack_ocean.F90
  icepack/columnphysics/icepack_orbital.F90
  icepack/columnphysics/icepack_parameters.F90
  icepack/columnphysics/icepack_shortwave.F90
  icepack/columnphysics/icepack_therm_0layer.F90
  icepack/columnphysics/icepack_therm_bl99.F90
  icepack/columnphysics/icepack_therm_itd.F90
  icepack/columnphysics/icepack_therm_mushy.F90
  icepack/columnphysics/icepack_therm_shared.F90
  icepack/columnphysics/icepack_therm_vertical.F90
  icepack/columnphysics/icepack_tracers.F90
  icepack/columnphysics/icepack_warnings.F90
  icepack/columnphysics/icepack_wavefracspec.F90
  icepack/columnphysics/icepack_zbgc.F90
  icepack/columnphysics/icepack_zbgc_shared.F90
  icepack/columnphysics/icepack_zsalinity.F90
)

#-- Using MPI
list(APPEND mpi_comm_files
  cicecore/cicedynB/infrastructure/comm/mpi/ice_boundary.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_broadcast.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_communicate.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_exit.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_gather_scatter.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_global_reductions.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_reprosum.F90
  cicecore/cicedynB/infrastructure/comm/mpi/ice_timers.F90
)

#-- Using Serial
list(APPEND serial_comm_files
  cicecore/cicedynB/infrastructure/comm/serial/ice_boundary.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_broadcast.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_communicate.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_exit.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_gather_scatter.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_global_reductions.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_reprosum.F90
  cicecore/cicedynB/infrastructure/comm/serial/ice_timers.F90
)

#-- Using binary IO
list(APPEND binary_io_files
  cicecore/cicedynB/infrastructure/io/io_binary/ice_history_write.F90
  cicecore/cicedynB/infrastructure/io/io_binary/ice_restart.F90
)

#-- Using NetCDF IO
list(APPEND netcdf_io_files
  cicecore/cicedynB/infrastructure/io/io_netcdf/ice_history_write.F90
  cicecore/cicedynB/infrastructure/io/io_netcdf/ice_restart.F90
)

#PIO2 I/O List:
list(APPEND pio2_io_files
  cicecore/cicedynB/infrastructure/io/io_pio2/ice_history_write.F90
  cicecore/cicedynB/infrastructure/io/io_pio2/ice_pio.F90
  cicecore/cicedynB/infrastructure/io/io_pio2/ice_restart.F90
)

#-- Using standalone driver
list(APPEND standalone_driver_files
  cicecore/drivers/standalone/cice/CICE.F90
  cicecore/drivers/standalone/cice/CICE_FinalMod.F90
  cicecore/drivers/standalone/cice/CICE_InitMod.F90
  cicecore/drivers/standalone/cice/CICE_RunMod.F90
)

#-- Using NUOPC CMEPS driver
list(APPEND nuopc_cmeps_driver_files
  cicecore/drivers/nuopc/cmeps/CICE_FinalMod.F90
  cicecore/drivers/nuopc/cmeps/CICE_InitMod.F90
  cicecore/drivers/nuopc/cmeps/CICE_RunMod.F90
  cicecore/drivers/nuopc/cmeps/cice_wrapper_mod.F90
  cicecore/drivers/nuopc/cmeps/ice_comp_nuopc.F90
  cicecore/drivers/nuopc/cmeps/ice_import_export.F90
  cicecore/drivers/nuopc/cmeps/ice_prescribed_mod.F90
  cicecore/drivers/nuopc/cmeps/ice_scam.F90
  cicecore/drivers/nuopc/cmeps/ice_shr_methods.F90
)

#-- Using NUOPC DMI driver
list(APPEND nuopc_dmi_driver_files
  cicecore/drivers/nuopc/dmi/CICE.F90
  cicecore/drivers/nuopc/dmi/CICE_FinalMod.F90
  cicecore/drivers/nuopc/dmi/CICE_InitMod.F90
  cicecore/drivers/nuopc/dmi/CICE_RunMod.F90
)

#-- Using direct driver
list(APPEND direct_driver_files
  cicecore/drivers/direct/hadgem3/CICE.F90
  cicecore/drivers/direct/hadgem3/CICE_FinalMod.F90
  cicecore/drivers/direct/hadgem3/CICE_InitMod.F90
  cicecore/drivers/direct/hadgem3/CICE_RunMod.F90
)

#-- Using MCT driver
list(APPEND mct_driver_files
  cicecore/drivers/mct/cesm1/CICE_FinalMod.F90
  cicecore/drivers/mct/cesm1/CICE_InitMod.F90
  cicecore/drivers/mct/cesm1/CICE_RunMod.F90
  cicecore/drivers/mct/cesm1/ice_comp_esmf.F90
  cicecore/drivers/mct/cesm1/ice_comp_mct.F90
  cicecore/drivers/mct/cesm1/ice_cpl_indices.F90
  cicecore/drivers/mct/cesm1/ice_import_export.F90
  cicecore/drivers/mct/cesm1/ice_prescribed_mod.F90
  cicecore/drivers/mct/cesm1/ice_scam.F90
)
