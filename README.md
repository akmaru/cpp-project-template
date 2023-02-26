# C++ Template: A template project for C/C++

## Features  
* Development Environment
  * [Docker](https://docs.docker.com/)
  * [Docker Compose](https://docs.docker.com/compose/)
  * [VSCode devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) also supported.
* Build System
  * [CMake](https://cmake.org/)
  * [Ninja](https://ninja-build.org/)
* Coding Style: [Google C++ Style](https://google.github.io/styleguide/cppguide.html)
* Formatter: [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* Lintee: [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
* Test Framework: [Google Test](https://github.com/google/googletest)
* Benchmark Framework: [Google Benchmark](https://github.com/google/benchmark)
* CI/CD: [GitHub Actions](https://docs.github.com/en/actions)



## Development environment setup
### Initialize
At first, you need to set [environment variables referenced by docker-compose.yml](https://docs.docker.com/compose/environment-variables/set-environment-variables/).


```sh
./docker/init_env.sh
```

### Build and launch Docker Image
You can build and launch the development environment by using [Docker Compose](https://docs.docker.com/compose/)


```sh
docker-compose build
docker-compose run dev
```

or, you can also do it by using [VSCode devcontainer](https://code.visualstudio.com/docs/devcontainers/containers), by executing `Dev Containers: Open Folder in Container...` and select the project's root directory.

## Build

You can configure by using [CMake](https://cmake.org/) and build fastly by using [Ninja](https://ninja-build.org/)

```sh
cmake -B build -GNinja
cmake --build build
```

## Test

You can test by running [CTest](https://cmake.org/cmake/help/latest/manual/ctest.1.html).
The project uses [Google Test](https://github.com/google/googletest) as the test framework.

```sh
ctest --test-dir build
```

## Benchmark

The project uses [Google Benchmark](https://github.com/google/benchmark) as the benchmark framework.

```sh
./build/bin/cpp-template_benchmark
```

You can get the following result:

```sh
2023-02-26T12:31:10+00:00
Running ./build/bin/cpp-template_benchmark
Run on (80 X 3383.81 MHz CPU s)
CPU Caches:
  L1 Data 32 KiB (x40)
  L1 Instruction 32 KiB (x40)
  L2 Unified 256 KiB (x40)
  L3 Unified 51200 KiB (x2)
Load Average: 2.95, 3.46, 3.50
-------------------------------------------------------
Benchmark             Time             CPU   Iterations
-------------------------------------------------------
BM_vadd/8           114 ns          114 ns      6336100
BM_vadd/64          276 ns          276 ns      2492204
BM_vadd/512        1342 ns         1342 ns       533077
BM_vadd/4096      10032 ns        10030 ns        71436
BM_vadd/8192      19511 ns        19506 ns        36428
```

## Format check
### C/C++ source code

```sh
find . -type f -name "*.h" -not -path './build/*' -or -name "*.cc" -not -path './build/*' | xargs clang-format --dry-run -Werror
```

### CMake

```sh
find . -type f -name "CMakeLists.txt" -not -path './build/*' -or -name "*.cmake" -not -path './build/*' | xargs cmake-format --check
```

## Lint check

```sh
find . -type f -name "*.h" -not -path './build/*' -or -name "*.cc" -not -path './build/*' | xargs clang-tidy -p build
```
