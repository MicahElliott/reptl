# REPTL: Read, Eval, Print, TEST, Loop (for Racket)

<img src="https://raw.githubusercontent.com/MicahElliott/reptl/master/reptl.jpg"
 alt="Reptl Screenshot" title="Reptl Screenshot" align="right" />

_(pronounced “Reptile”)_

Runs tests continuously, shows green and red, watches for file changes.

Only ever used minimally, only on Linux.

## How to run
0. Add path of `reptl` dir to your `PATH`, or copy its files into say `~/bin`.

1. Write some rackunit tests and get them to run via `raco test`.

2. Run on file(s) glob pattern, like `reptl.zsh ./http*(.)`, to repeatedly run tests as files change.

## How it works
Trivially simple implementation using `inotify`.

- Files changes watched for via `inotifywait`.

- Runs `raco test` on change.

- Pretty pop-up notifications via `inotify-send`.

- Writes some red/green bars to terminal.

## How is sucks
- Coarse granularity: simply runs all tests on change
- No installer yet; might add to AUR
