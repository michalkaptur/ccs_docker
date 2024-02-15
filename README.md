# Code Composer Studio docker

Docker image for command line MSP430 firmware build using Code Composer Studio.
Suitable for automated CI builds.

## Building

```sh
docker build . -tag ccs
```

## Usage

Firmware build:
```sh
docker run --rm -v${PWD}:/work -w /work ccs -data WORKSPACE -application com.ti.ccstudio.apps.projectBuild -ccs.projects PROJECT
```

Poke around interactively:
```sh
docker run --rm -it -v${PWD}:/work -w /work --entrypoint bash ccs
```

## Known issues

- Build process gets stuck for a couple of minutes somewhere between makefiles generation and the compilation step, [ticket](https://e2e.ti.com/support/tools/code-composer-studio-group/ccs/f/code-composer-studio-forum/1324669/ccs-command-line-build-is-extremely-slow-when-executed-within-docker-container/5040447#5040447)