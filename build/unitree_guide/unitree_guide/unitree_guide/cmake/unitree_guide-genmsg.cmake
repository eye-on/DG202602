# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "unitree_guide: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iunitree_guide:/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(unitree_guide_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_custom_target(_unitree_guide_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_guide" "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" ""
)

get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_custom_target(_unitree_guide_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unitree_guide" "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" "unitree_guide/CustomPoint:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_guide
)
_generate_msg_cpp(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_guide
)

### Generating Services

### Generating Module File
_generate_module_cpp(unitree_guide
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_guide
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(unitree_guide_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(unitree_guide_generate_messages unitree_guide_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_cpp _unitree_guide_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_cpp _unitree_guide_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_guide_gencpp)
add_dependencies(unitree_guide_gencpp unitree_guide_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_guide_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_guide
)
_generate_msg_eus(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_guide
)

### Generating Services

### Generating Module File
_generate_module_eus(unitree_guide
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_guide
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(unitree_guide_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(unitree_guide_generate_messages unitree_guide_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_eus _unitree_guide_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_eus _unitree_guide_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_guide_geneus)
add_dependencies(unitree_guide_geneus unitree_guide_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_guide_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_guide
)
_generate_msg_lisp(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_guide
)

### Generating Services

### Generating Module File
_generate_module_lisp(unitree_guide
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_guide
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(unitree_guide_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(unitree_guide_generate_messages unitree_guide_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_lisp _unitree_guide_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_lisp _unitree_guide_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_guide_genlisp)
add_dependencies(unitree_guide_genlisp unitree_guide_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_guide_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_guide
)
_generate_msg_nodejs(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_guide
)

### Generating Services

### Generating Module File
_generate_module_nodejs(unitree_guide
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_guide
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(unitree_guide_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(unitree_guide_generate_messages unitree_guide_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_nodejs _unitree_guide_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_nodejs _unitree_guide_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_guide_gennodejs)
add_dependencies(unitree_guide_gennodejs unitree_guide_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_guide_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide
)
_generate_msg_py(unitree_guide
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide
)

### Generating Services

### Generating Module File
_generate_module_py(unitree_guide
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(unitree_guide_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(unitree_guide_generate_messages unitree_guide_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomPoint.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_py _unitree_guide_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/Guoyulun/SimEnv/src/unitree_guide/unitree_guide/unitree_guide/msg/CustomMsg.msg" NAME_WE)
add_dependencies(unitree_guide_generate_messages_py _unitree_guide_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unitree_guide_genpy)
add_dependencies(unitree_guide_genpy unitree_guide_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unitree_guide_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_guide)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unitree_guide
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(unitree_guide_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_guide)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unitree_guide
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(unitree_guide_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_guide)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unitree_guide
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(unitree_guide_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_guide)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unitree_guide
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(unitree_guide_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unitree_guide
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(unitree_guide_generate_messages_py std_msgs_generate_messages_py)
endif()
