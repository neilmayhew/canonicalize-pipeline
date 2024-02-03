# canonicalize-pipeline

_Canonicalize a Concourse pipeline file_

Adjust a Concourse pipeline file to a standard form so that it can be compared against other pipeline files (including the YAML that was used to define it originally) without noise from differences that aren't semantically meaningful (eg list ordering).

An executable can be built with [nix](https://nixos.org/) using:

```shell
nix build

```

By default, this will build a statically-linked version, except on macOS. You can select the type of linking explicitly with

```shell
nix build .#dynamic
```

or

```shell
nix build .#static
```

The executable will be in `result/bin/canonicalize-pipeline`:

```shellsession
$ ls -lh result/bin/canonicalize-pipeline
-r-xr-xr-x 1 root root 15M Dec 31  1969 result/bin/canonicalize-pipeline

$ file result/bin/canonicalize-pipeline
result/bin/canonicalize-pipeline: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped

$ result/bin/canonicalize-pipeline --help
Usage: canonicalize-pipeline [FILE]

  Canonicalize a Concourse pipeline file

Available options:
  -h,--help                Show this help text
  FILE                     Help (default: /dev/stdin)

Currently, the only transformation is to sort the resources by name.
```
