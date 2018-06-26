#!/usr/bin/env bash
# Copyright 2017 Google Inc.
# All Rights Reserved.
#
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

set -e
# set -e 命令用法总结如下：
# 1. 当命令的返回值为非零状态时，则立即退出脚本的执行。
# 2. 作用范围只限于脚本执行的当前进行，不作用于其创建的子进程。
# 3. 另外，当想根据命令执行的返回值，输出对应的log时，最好不要采用set -e选项，
# 		而是通过配合exit 命令来达到输出log并退出执行的目的。

# ccache on OS X needs installation first
# reset ccache statistics
#ccache --zero-stats

echo PATH=${PATH}

echo "Compiler configuration:"
echo CXX=${CXX}
echo CC=${CC}
echo CXXFLAGS=${CXXFLAGS}

echo "C++ compiler version:"
${CXX} --version || echo "${CXX} does not seem to support the --version flag"
${CXX} -v || echo "${CXX} does not seem to support the -v flag"

echo "C compiler version:"
${CC} --version || echo "${CXX} does not seem to support the --version flag"
${CC} -v || echo "${CXX} does not seem to support the -v flag"
