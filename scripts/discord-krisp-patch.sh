#!/usr/bin/env nix-shell
#!nix-shell -i bash -p rizin

# from: https://github.com/NixOS/nixpkgs/issues/195512#issuecomment-1546794291

set -e

rizin_cmd="rizin"
rz_find_cmd="rz-find"

discord_version="0.0.32"
file="${HOME}/.config/discord/${discord_version}/modules/discord_krisp/discord_krisp.node"

addr=$($rz_find_cmd -x '4881ec00010000' ${file} | head -n1)
$rizin_cmd -q -w -c "s $addr + 0x30 ; wao nop" "${file}"

