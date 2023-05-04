#!/usr/bin/env bash

workbench_run() {
    docker exec workbench $@
}

neigh_flush() {
    workbench_run ip -s -s neigh flush all || true
}

masscan() {
    workbench_run /masscan/bin/masscan $@
}
