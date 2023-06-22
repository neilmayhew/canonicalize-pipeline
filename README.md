# canonicalize-pipeline

_Canonicalize a Concourse pipeline file_

Adjust a Concourse pipeline file to a standard form so that it can be compared against other pipeline files (including the YAML that was used to define it originally) without noise from differences that aren't semantically meaningful (eg list ordering).

A static executable can be built with [nix](https://nixos.org/) using:

```shell
nix build -f shell.nix

```

or

```shell
nix-build shell.nix
```

A dynamically-linked version can be selected by passing `--arg static false` to either the above commands.

The executable will be in `result/bin/canonicalize-pipeline`:

```shellsession
$ ls -lh result/bin/canonicalize-pipeline
-r-xr-xr-x 1 root root 15M Dec 31  1969 result/bin/canonicalize-pipeline
```
