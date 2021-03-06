#!/usr/bin/env bash

set -x -e

mkdir -p build/build_docker
cd build/build_docker
ccache -s ||:
cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DSANITIZE=$SANITIZER $CMAKE_FLAGS
ninja
ccache -s ||:
mv ./dbms/programs/clickhouse* /output
mv ./dbms/unit_tests_dbms /output
mv ./dbms/programs/odbc-bridge/clickhouse-odbc-bridge /output
