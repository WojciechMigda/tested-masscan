#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# parallel execution causes unsolicited packets
#$script_dir/bats-core/bin/bats --filter-tags !parallel:off -j `nproc` $script_dir/test/
#$script_dir/bats-core/bin/bats --filter-tags parallel:off $script_dir/test/

$script_dir/bats-core/bin/bats $script_dir/test/
