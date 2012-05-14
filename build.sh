#!/bin/bash

command -v fpc >/dev/null 2>&1 || { echo >&2 "FPC is required to build.  Aborting."; exit 1; }

fpc -FEbin/ sneaker.pas -v0ew -osneaker -TLINUX

echo "
---
Run ./bin/sneaker for instructions.
---
"