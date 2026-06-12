# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "building_generator_interfaces: 0 messages, 2 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(building_generator_interfaces_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_custom_target(_building_generator_interfaces_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "building_generator_interfaces" "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" ""
)

get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_custom_target(_building_generator_interfaces_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "building_generator_interfaces" "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/building_generator_interfaces
)
_generate_srv_cpp(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/building_generator_interfaces
)

### Generating Module File
_generate_module_cpp(building_generator_interfaces
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/building_generator_interfaces
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(building_generator_interfaces_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(building_generator_interfaces_generate_messages building_generator_interfaces_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_cpp _building_generator_interfaces_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_cpp _building_generator_interfaces_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(building_generator_interfaces_gencpp)
add_dependencies(building_generator_interfaces_gencpp building_generator_interfaces_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS building_generator_interfaces_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/building_generator_interfaces
)
_generate_srv_eus(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/building_generator_interfaces
)

### Generating Module File
_generate_module_eus(building_generator_interfaces
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/building_generator_interfaces
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(building_generator_interfaces_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(building_generator_interfaces_generate_messages building_generator_interfaces_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_eus _building_generator_interfaces_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_eus _building_generator_interfaces_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(building_generator_interfaces_geneus)
add_dependencies(building_generator_interfaces_geneus building_generator_interfaces_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS building_generator_interfaces_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/building_generator_interfaces
)
_generate_srv_lisp(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/building_generator_interfaces
)

### Generating Module File
_generate_module_lisp(building_generator_interfaces
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/building_generator_interfaces
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(building_generator_interfaces_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(building_generator_interfaces_generate_messages building_generator_interfaces_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_lisp _building_generator_interfaces_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_lisp _building_generator_interfaces_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(building_generator_interfaces_genlisp)
add_dependencies(building_generator_interfaces_genlisp building_generator_interfaces_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS building_generator_interfaces_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/building_generator_interfaces
)
_generate_srv_nodejs(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/building_generator_interfaces
)

### Generating Module File
_generate_module_nodejs(building_generator_interfaces
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/building_generator_interfaces
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(building_generator_interfaces_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(building_generator_interfaces_generate_messages building_generator_interfaces_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_nodejs _building_generator_interfaces_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_nodejs _building_generator_interfaces_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(building_generator_interfaces_gennodejs)
add_dependencies(building_generator_interfaces_gennodejs building_generator_interfaces_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS building_generator_interfaces_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces
)
_generate_srv_py(building_generator_interfaces
  "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces
)

### Generating Module File
_generate_module_py(building_generator_interfaces
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(building_generator_interfaces_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(building_generator_interfaces_generate_messages building_generator_interfaces_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/CallElevator.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_py _building_generator_interfaces_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/ws/SimEnv/src/building_generator_interfaces/srv/SetDoorState.srv" NAME_WE)
add_dependencies(building_generator_interfaces_generate_messages_py _building_generator_interfaces_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(building_generator_interfaces_genpy)
add_dependencies(building_generator_interfaces_genpy building_generator_interfaces_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS building_generator_interfaces_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/building_generator_interfaces)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/building_generator_interfaces
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/building_generator_interfaces)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/building_generator_interfaces
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/building_generator_interfaces)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/building_generator_interfaces
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/building_generator_interfaces)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/building_generator_interfaces
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/building_generator_interfaces
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
