#!/bin/bash
# SPDX-FileCopyrightText: 2026 Yoshinari Aita
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

### NORMAL INPUT ###
out=$(cat words.txt | ./randpick)

[ "$?" = 0 ] || ng "$LINENO"

grep -Fxq "$out" words.txt || ng "$LINENO"

[ -n "$out" ] || ng "$LINENO"

### EMPTY INPUT ###
out=$(printf '' | ./randpick)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### SINGLE INPUT ###
out=$(echo "Warframe" | ./randpick)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "Warframe" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
