#!/usr/bin/env bash

masscan() {
    docker exec workbench /masscan/bin/masscan $@
}
