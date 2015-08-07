# REPTL, Read, Eval, Print, TEST, Loop

(pronounced “Reptile”)

Continuously run racket tests. Shows green and red, watches for file changes.

## How to run
0. Add path to `reptl` dir to your `PATH`, or copy its files into say `~/bin`.

1. Write some rackunit tests and get them to run via `raco test`.

2. Run `reptl.zsh` to repeatedly run tests as files change.

## How it works
Trivially simple implementation using `inotify`.

- Files changes watched for via `inotifywait`.

- Runs `raco test` on change.

- Pretty pop-up notifications via `inotify-send`.

- Writes some red/green bars to terminal.
