#!/bin/sh
# Compile GoogleLoginForm.pas and MainModule.pas and run the login spec.
# The program exits 0 only when an unverified success event is rejected.
set -eu
cd "$(dirname "$0")"
mkdir -p build
fpc -Mdelphi -Fu"stubs" -Fu".." -FE"build" -FU"build" GoogleLoginBypassTests.pas
"build/GoogleLoginBypassTests"
