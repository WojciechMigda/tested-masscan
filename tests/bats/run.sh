#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Parallel execution causes unsolicited ARP and NDP packets
#$script_dir/bats-core/bin/bats -j `nproc` $script_dir/test/

$script_dir/bats-core/bin/bats $script_dir/test/
