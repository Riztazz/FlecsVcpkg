vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO SanderMertens/flecs
  REF ae64dda9155fd2e29fe06f2eb45e59803ffbb1f0
  SHA512 980e945c7d2f2d7ff815984cafbaf1e7d6f421464dd1c41ee053d1912e2eb16d1078677b061a3a93336aa7d597f44ba388165f821292172a695ced896fa7635f
  HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    DISABLE_PARALLEL_CONFIGURE
)

vcpkg_cmake_install()

if(EXISTS ${CURRENT_PACKAGES_DIR}/cmake)
    vcpkg_cmake_config_fixup(CONFIG_PATH cmake)
else()
    vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/flecs)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)