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

# bats test_tags: usage
@test "Usage is shown when run without arguments" {
    run -1 masscan

    assert_output --partial "usage:"
}

# bats test_tags: usage
@test "Usage shows '--ipv6-allow-link-local' help entry" {
    run -1 masscan

    assert_output --partial "--ipv6-allow-link-local:"
}

# bats test_tags: usage
@test "Usage shows '--with-lan-arp' help entry" {
    run -1 masscan

    assert_output --partial "--with-lan-arp:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-fast-fail' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-fast-fail:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-retries' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-retries UINT:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-shotgun-scan' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-shotgun-scan-wait' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-wait UINT:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-shotgun-scan-repeats' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-repeats UINT:"
}

# bats test_tags: usage
@test "Usage shows '--lan-arp-shotgun-scan-rate' help entry" {
    run -1 masscan

    assert_output --partial "--lan-arp-shotgun-scan-rate REAL:"
}

# bats test_tags: usage
@test "Usage shows '--snmp-v1' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v1:"
}

# bats test_tags: usage
@test "Usage shows '--snmp-v2c' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v2c:"
}

# bats test_tags: usage
@test "Usage shows '--snmp-v3' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-v3:"
}

# bats test_tags: usage
@test "Usage shows '--snmp-comm' help entry" {
    run -1 masscan

    assert_output --partial "--snmp-comm <community>:"
}
