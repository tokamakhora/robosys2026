#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Yoshinari Aita
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

lines = sys.stdin.readlines()

print(random.choice(lines).rstrip())
