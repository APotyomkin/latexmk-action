[![test](https://github.com/yegor256/latexmk-action/actions/workflows/test.yml/badge.svg)](https://github.com/yegor256/latexmk-action/actions/workflows/test.yml)

To `latexmk` your LaTeX document by GitHub Action just 
create a `.github/workflows/latexmk.yml` file:

```yaml
name: latexmk
on:
  push:
  pull_request:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: yegor256/latexmk-action@0.3.0
        with:
          cmd: latexmk
          path: foo
          opts: -pdf
          packages: acmart tikz
```

Preferrably, you should have `.latexmkrc` in the `foo` directory of your repository,
which configures the behavior of [latexmk](https://mg.readthedocs.io/latexmk.html).
If you don't have special requirements in your project, and just need to compile
a `.tex` file, skip the config, everything should work out of the box.

The options available (provided via the `with` YAML element):

  * `cmd` is the command to run (default is `latexmk`)
  * `path` is a relative path of the directory with `.tex` file(s)
  * `opts` is the options to pass to `latexmk`
  * `packages` is a space-separated list of TeXLive package to install from [CTAN](https://ctan.org)

In order to test this action, just run:

```bash
$ make test
```

This should build a new Docker image and then try to use it
in order to render a simple `test.tex` document. You need to have
[Docker](https://docs.docker.com/get-docker/) installed.
