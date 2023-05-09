bats_require_minimum_version 1.5.0

setup_file() {
    # load() in setup_file does not work
    #load 'test_helper/bats-support/load'
    #load 'test_helper/bats-assert/load'
    echo
}

#teardown_file() {
#    echo
#}

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/common-masscan'
}

#teardown() {
#    echo
#}

# bats file_tags= usage, parallel:on

@test "Usage is shown when run without arguments" {
    run -1 masscan

    assert_output --partial "usage:"
}

@test "Usage shows '--ipv6-allow-link-local' help entry" {
    run -1 masscan

    assert_output --partial "--ipv6-allow-link-local:"
}

@test "Usage shows '--with-lan-arp' help entry" {
    run -1 masscan

    assert_output --partial "--with-lan-arp:"
}

@test "Usage shows '--lan-arp-fast-fail' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-fast-fail:"
}

@test "Usage shows '--lan-arp-retries' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-retries UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan:"
}

@test "Usage shows '--lan-arp-shotgun-scan-wait' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-wait UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan-repeats' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-repeats UINT:"
}

@test "Usage shows '--lan-arp-shotgun-scan-rate' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-rate REAL:"
}

@test "Usage shows '--snmp-v1' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v1:"
}

@test "Usage shows '--snmp-v2c' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v2c:"
}

@test "Usage shows '--snmp-v3' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v3:"
}

@test "Usage shows '--snmp-comm' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-comm <community>:"
}

@test "Usage shows '--fast-port-status' help entry" {
    run -1 masscan

    assert_output --partial "--fast-port-status:"
}

@test "Accepts '--fast-port-status' flag" {
    run masscan --fast-port-status --echo

    refute_output --partial "CONF: unknown config option:"
    refute_output --partial ": empty parameter"
    assert_output --partial "fast-port-status = true"
}

@test "Usage shows '--fast-port-status-use' help entry" {
    run -1 masscan

    assert_output --partial "--fast-port-status-use <selection>:"
}

@test "Accepts '--fast-port-status-use' with empty list" {
    run masscan --fast-port-status-use , --echo

    refute_output --partial "CONF: unknown config option:"
    refute_output --partial ": empty parameter"
    assert_output "fast-port-status-use = udp,tcp,sctp,"
}

@test "Accepts '--fast-port-status-use' with already used selection" {
    run masscan --fast-port-status-use sctp,udp,tcp --echo

    refute_output --partial "CONF: unknown config option:"
    refute_output --partial ": empty parameter"
    assert_output "fast-port-status-use = udp,tcp,sctp,"
}

@test "Accepts '--fast-port-status-use' with new selection" {
    run masscan --fast-port-status-use arp,dns,icmp --echo

    refute_output --partial "CONF: unknown config option:"
    refute_output --partial ": empty parameter"
    assert_output "fast-port-status-use = udp,tcp,sctp,icmp,dns,arp,"
}
