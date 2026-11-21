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

### EMPTY LINE ###
out=$(printf 'Warframe\n\n原神\n\nMinecraft\n' | ./randpick)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "Warframe" ] || [ "${out}" = "原神" ] || [ "${out}" = "Minecraft" ] || ng "$LINENO"

### ONLY EMPTY LINES ###
out=$(printf '\n\n\n' | ./randpick)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### SPACE SEPARATED INPUT ###
out=$(echo "Warframe 原神 Minecraft" | ./randpick)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "Warframe" ] || [ "${out}" = "原神" ] || [ "${out}" = "Minecraft" ] || ng "$LINENO"

### SELECT ONE ###
out=$(echo "Warframe 原神 Minecraft Undertale" | ./randpick -n 1)
[ "$?" = 0 ] || ng "$LINENO"
[ -n "$out" ] || ng "$LINENO"

### SELECT TWO ###
out=$(echo "Warframe 原神 Minecraft Undertale" | ./randpick -n 2)
[ "$?" = 0 ] || ng "$LINENO"
[ "$(printf '%s\n' "$out" | wc -l)" -eq 2 ] || ng "$LINENO"
[ "$(printf '%s\n' "$out" | sort -u | wc -l)" -eq 2 ] || ng "$LINENO"

### SELECT THREE ###
out=$(echo "Warframe 原神 Minecraft Undertale" | ./randpick -n 3)
[ "$?" = 0 ] || ng "$LINENO"
[ "$(printf '%s\n' "$out" | wc -l)" -eq 3 ] || ng "$LINENO"
[ "$(printf '%s\n' "$out" | sort -u | wc -l)" -eq 3 ] || ng "$LINENO"

### LONG OPTION ###
out=$(echo "Warframe 原神 Minecraft" | ./randpick --number 2)
[ "$?" = 0 ] || ng "$LINENO"
[ "$(printf '%s\n' "$out" | wc -l)" -eq 2 ] || ng "$LINENO"

### TOO MANY ITEMS ###
out=$(echo "Warframe 原神" | ./randpick -n 3 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

### ZERO ITEMS ###
out=$(echo "Warframe 原神" | ./randpick -n 0 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

### INVALID NUMBER ###
out=$(echo "Warframe 原神" | ./randpick -n abc 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

### INVALID OPTION ###
out=$(echo "Warframe 原神" | ./randpick -x 2>&1)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
