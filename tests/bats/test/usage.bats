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
    load 'test_helper/common-assert'
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

@test "Accepts '--ipv6-allow-link-local' flag" {
    run masscan --echo --ipv6-allow-link-local

    refute_bad_option_output
    assert_line "ipv6-allow-link-local = true"
}

@test "Usage shows '--with-lan-arp' help entry" {
    run -1 masscan

    assert_output --partial "--with-lan-arp:"
}

@test "Accepts '--with-lan-arp' flag" {
    run masscan --echo --with-lan-arp

    refute_bad_option_output
    assert_line "with-lan-arp = true"
}

@test "Usage shows '--lan-arp-fast-fail' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-fast-fail:"
}

@test "Accepts '--lan-arp-fast-fail'" {
    run masscan --echo --lan-arp-fast-fail

    refute_bad_option_output
    assert_line "lan-arp-fast-fail = true"
}

@test "Usage shows '--lan-arp-retries' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-retries UINT:"
}

@test "Accepts '--lan-arp-retries' with a positive integer value" {
    run masscan --echo --lan-arp-retries 2

    refute_bad_option_output
    assert_line "lan-arp-retries = 2"
}

@test "Rejects '--lan-arp-retries' without a value" {
    run masscan --echo --lan-arp-retries

    refute_line --partial "lan-arp-retries ="
    assert_line --partial "lan-arp-retries: empty parameter"
}

@test "Usage shows '--lan-arp-shotgun-scan' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan:"
}

@test "Accepts '--lan-arp-shotgun-scan'" {
    run masscan --echo --lan-arp-shotgun-scan

    refute_bad_option_output
    assert_line "lan-arp-shotgun-scan = true"
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

@test "Accepts '--snmp-v1'" {
    run masscan --echo --snmp-v1

    refute_bad_option_output
    assert_line "snmp-v1 = true"
}

@test "Usage shows '--snmp-v2c' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v2c:"
}

@test "Accepts '--snmp-v2c'" {
    run masscan --echo --snmp-v2c

    refute_bad_option_output
    assert_line "snmp-v2c = true"
}

@test "Usage shows '--snmp-v3' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v3:"
}

@test "Accepts '--snmp-v3'" {
    run masscan --echo --snmp-v3

    refute_bad_option_output
    assert_line "snmp-v3 = true"
}

@test "Usage shows '--snmp-comm' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-comm <community>:"
}

################################################################################
###     Fast Port Status
################################################################################

@test "Usage shows '--fast-port-status' help entry" {
    run -1 masscan

    assert_output --partial "--fast-port-status:"
}

@test "Accepts '--fast-port-status' flag" {
    run masscan --echo --fast-port-status

    refute_bad_option_output
    assert_line "fast-port-status = true"
}

@test "Usage shows '--fast-port-status-use' help entry" {
    run -1 masscan

    assert_output --partial "--fast-port-status-use <selection>:"
}

@test "Usage shows '--fast-port-status-exclude' help entry" {
    run -1 masscan

    assert_output --partial "--fast-port-status-exclude <selection>:"
}

@test "Accepts '--fast-port-status-use' with empty list" {
    run masscan --echo --fast-port-status --fast-port-status-use ,

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,sctp,"
}

@test "Accepts '--fast-port-status-use' with selection already in use" {
    run masscan --echo --fast-port-status --fast-port-status-use sctp,udp,tcp

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,sctp,"
}

@test "Accepts '--fast-port-status-use' with new selection" {
    run masscan --echo --fast-port-status-use arp,dns,icmp

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,sctp,icmp,dns,arp,"
}

@test "Accepts '--fast-port-status-use' with 'all' selection" {
    run masscan --echo --fast-port-status-use all

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,sctp,icmp,dns,arp,"
}

@test "Rejects '--fast-port-status-use' with unknown selector" {
    run -1 masscan --echo --fast-port-status-use garbage

    assert_line "FAIL: unknown 'fast_port_status-use' selector: garbage"
}

@test "Rejects '--fast-port-status-exclude' with unknown selector" {
    run -1 masscan --echo --fast-port-status-exclude garbage

    assert_line "FAIL: unknown 'fast_port_status-exclude' selector: garbage"
}


@test "Accepts '--fast-port-status-exclude' with empty list" {
    run masscan --echo --fast-port-status --fast-port-status-exclude ,

    refute_bad_option_output
    assert_line "fast-port-status-exclude = "
}

@test "Accepts '--fast-port-status-exclude' with selection in use" {
    run masscan --echo --fast-port-status --fast-port-status-exclude sctp

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,"
    assert_line "fast-port-status-exclude = sctp,"
}

@test "Accepts '--fast-port-status-exclude' with selection not in use" {
    run masscan --echo --fast-port-status --fast-port-status-exclude icmp,dns,arp

    refute_bad_option_output
    assert_line "fast-port-status-use = udp,tcp,sctp,"
    assert_line "fast-port-status-exclude = "
}

@test "Accepts combination of '--fast-port-status-use' and '--fast-port-status-exclude'" {
    run masscan --echo --fast-port-status-use arp,icmp --fast-port-status-exclude sctp,udp,icmp

    refute_bad_option_output
    assert_line "fast-port-status-use = tcp,arp,"
    assert_line "fast-port-status-exclude = udp,sctp,"
}
