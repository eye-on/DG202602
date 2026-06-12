#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/ws/SimEnv/src/building_generator_classic"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/ws/SimEnv/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/ws/SimEnv/install/lib/python3/dist-packages:/ws/SimEnv/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/ws/SimEnv/build" \
    "/usr/bin/python3" \
    "/ws/SimEnv/src/building_generator_classic/setup.py" \
     \
    build --build-base "/ws/SimEnv/build/building_generator_classic" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/ws/SimEnv/install" --install-scripts="/ws/SimEnv/install/bin"
