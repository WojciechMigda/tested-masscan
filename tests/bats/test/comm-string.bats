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

# bats test_tags: snmp-v1 ipv4 wan community
@test "WAN IPv4 target scan for snmp v1 reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --banners \
        10.7.0.161

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1] [c=public]"
}

# bats test_tags: snmp-v2c ipv4 wan community
@test "WAN IPv4 target scan for snmp v2c reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --banners \
        10.7.0.161

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c] [c=public]"
}

# bats test_tags: snmp-v1 ipv4 wan community
@test "WAN IPv4 target scan for snmp v1 reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --snmp-comm secret \
        --banners \
        10.7.0.161

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1] [c=secret]"
}

# bats test_tags: snmp-v2c ipv4 wan community
@test "WAN IPv4 target scan for snmp v2c reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --snmp-comm secret \
        --banners \
        10.7.0.161

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c] [c=secret]"
}




# bats test_tags: snmp-v1 ipv6 wan community
@test "WAN IPv6 target scan for snmp v1 reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --banners \
        --range 2480:db8:1:7::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v1] [c=public]"
}

# bats test_tags: snmp-v2c ipv6 wan community
@test "WAN IPv6 target scan for snmp v2c reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --banners \
        --range 2480:db8:1:7::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v2c] [c=public]"
}

# bats test_tags: snmp-v1 ipv6 wan community
@test "WAN IPv6 target scan for snmp v1 reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --snmp-comm secret \
        --banners \
        --range 2480:db8:1:7::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v1] [c=secret]"
}

# bats test_tags: snmp-v2c ipv6 wan community
@test "WAN IPv6 target scan for snmp v2c reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --snmp-comm secret \
        --banners \
        --range 2480:db8:1:7::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v2c] [c=secret]"
}




# bats test_tags: snmp-v1 ipv4 lan community
@test "LAN IPv4 target scan for snmp v1 reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --banners \
        10.9.0.161

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v1] [c=public]"
}

# bats test_tags: snmp-v2c ipv4 lan community
@test "LAN IPv4 target scan for snmp v2c reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --banners \
        10.9.0.161

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v2c] [c=public]"
}

# bats test_tags: snmp-v1 ipv4 lan community
@test "LAN IPv4 target scan for snmp v1 reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --snmp-comm secret \
        --banners \
        10.9.0.161

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v1] [c=secret]"
}

# bats test_tags: snmp-v2c ipv4 lan community
@test "LAN IPv4 target scan for snmp v2c reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --snmp-comm secret \
        --banners \
        10.9.0.161

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v2c] [c=secret]"
}




# bats test_tags: snmp-v1 ipv6 lan community
@test "LAN IPv6 target scan for snmp v1 reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --banners \
        --range 2480:db8:1:9::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v1] [c=public]"
}

# bats test_tags: snmp-v2c ipv6 lan community
@test "LAN IPv6 target scan for snmp v2c reports default community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --banners \
        --range 2480:db8:1:9::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v2c] [c=public]"
}

# bats test_tags: snmp-v1 ipv6 lan community
@test "LAN IPv6 target scan for snmp v1 reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v1 \
        --snmp-comm secret \
        --banners \
        --range 2480:db8:1:9::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v1] [c=secret]"
}

# bats test_tags: snmp-v2c ipv6 lan community
@test "LAN IPv6 target scan for snmp v2c reports custom community string" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v2c \
        --snmp-comm secret \
        --banners \
        --range 2480:db8:1:9::00a3

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v2c] [c=secret]"
}
