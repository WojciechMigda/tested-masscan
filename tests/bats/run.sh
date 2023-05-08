#!/bin/bash

set -euo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# WARNING: parallel execution of scan scenarios causes unsolicited packets
$script_dir/bats-core/bin/bats --filter-tags !parallel:on $script_dir/test/
$script_dir/bats-core/bin/bats --filter-tags parallel:on -j `nproc` $script_dir/test/
