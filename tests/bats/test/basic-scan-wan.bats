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

# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv4 wan
@test "Can scan single default WAN IPv4 target for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        10.7.0.161

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v3]"
}


# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv4 wan
@test "Can scan two default WAN IPv4 targets for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        10.7.0.161 10.7.0.163

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v3]"
}

# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv4 wan
@test "Can scan range of default WAN IPv4 targets for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        10.7.0.128/25

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v3]"
}

# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv6 wan
@test "Can scan single default WAN IPv6 target for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        --range 2480:db8:1:7::00a1

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v3]"
}


# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv6 wan
@test "Can scan two default WAN IPv6 targets for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        --range 2480:db8:1:7::00a1 --range 2480:db8:1:7::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v3]"
}

# bats test_tags: snmp-v1 snmp-v2c snmp-v3 ipv6 wan
@test "Can scan range of default WAN IPv6 targets for snmp v1, v2c, and v3" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        --range 2480:db8:1:7::0080/121

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v3]"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v3]"
}
