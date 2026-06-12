# CMake generated Testfile for 
# Source directory: /ws/SimEnv/src/building_generator_core
# Build directory: /ws/SimEnv/build/building_generator_core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_building_generator_core_nosetests_test "/ws/SimEnv/build/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/ws/SimEnv/build/test_results/building_generator_core/nosetests-test.xml" "--return-code" "\"/usr/bin/cmake\" -E make_directory /ws/SimEnv/build/test_results/building_generator_core" "/usr/bin/nosetests3 -P --process-timeout=60 --where=/ws/SimEnv/src/building_generator_core/test --with-xunit --xunit-file=/ws/SimEnv/build/test_results/building_generator_core/nosetests-test.xml")
set_tests_properties(_ctest_building_generator_core_nosetests_test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/nosetests.cmake;83;catkin_run_tests_target;/ws/SimEnv/src/building_generator_core/CMakeLists.txt;16;catkin_add_nosetests;/ws/SimEnv/src/building_generator_core/CMakeLists.txt;0;")
