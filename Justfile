default:
    @just --list --unsorted

host := `uname -a`

# used for building pcre...
export CC := "musl-gcc -static"

project     := "datediff"
main_file   := project + ".nim"
main_exec   := project
musl_exec   := project + "_x86_64-unknown-linux-musl"

alias b := build
alias s := shasum
alias r := release

# build main
# Garbage Collector and Memory management https://nim-lang.org/docs/mm.html
# --mm:markAndSweep \
# --mm:arc \
build:
    nim --gcc.exe:musl-gcc \
    --gcc.linkerexe:musl-gcc \
    --mm:orc \
    -d:release \
    --opt:speed \
    --passL:-static \
    --dynlibOverrideAll \
    compile {{main_file}}

# run a specific test
# test TEST: build
#     ./test --test {{TEST}}

shasum:
    sha256sum {{main_exec}} >{{main_exec}}.sha256

release tag:
    gh release create {{tag}}