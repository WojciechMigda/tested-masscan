bats_require_minimum_version 1.5.0

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/common-masscan'
    load 'test_helper/common-assert'
}

# bats file_tags= fast-port-status

# bats test_tags: lan, ipv4
@test "LAN IPv4 target scan for 3 snmp versions skips remaining probes after first success" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --rate 1 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        10.9.0.161

    assert_line_count --partial 1 "Banner on port 161/udp on 10.9.0.161: [snmp]"
    assert_line_count --regexp 1 "Discovered (open|closed) port 161/udp on 10.9.0.161"
}

# bats test_tags: lan, ipv4
@test "LAN IPv4 target scan for multiple TCP ports skips remaining probes after first success" {
    run \
      masscan \
        -p22,23,135,137,1433,1521,3389,5985,179,199 \
        --wait 2 \
        --rate 1 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        10.9.0.81

    assert_line_count --regexp 1 "Discovered (open|closed) port [[:digit:]]+/tcp on 10.9.0.81"
}

# bats test_tags: lan, ipv6
@test "LAN IPv6 target scan for 3 snmp versions skips remaining probes after first success" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --rate 1 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        --range 2480:db8:1:9::00a1

    assert_line_count --partial 1 "Banner on port 161/udp on 2480:db8:1:9::a1: [snmp]"
    assert_line_count --regexp 1 "Discovered (open|closed) port 161/udp on 2480:db8:1:9::a1"
}

# bats test_tags: lan, ipv6
@test "LAN IPv6 target scan for multiple TCP ports skips remaining probes after first success" {
    run \
      masscan \
        -p22,23,135,137,1433,1521,3389,5985,179,199 \
        --wait 2 \
        --rate 1 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        --range 2480:db8:1:9::0051

    assert_line_count --regexp 1 "Discovered (open|closed) port [[:digit:]]+/tcp on 2480:db8:1:9::51"
}
# bats test_tags: wan, ipv4
@test "WAN IPv4 target scan for 3 snmp versions skips remaining probes after first success" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --rate 1 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        10.7.0.161

    assert_line_count --partial 1 "Banner on port 161/udp on 10.7.0.161: [snmp]"
    assert_line_count --regexp 1 "Discovered (open|closed) port 161/udp on 10.7.0.161"
}

# bats test_tags: wan, ipv6
@test "WAN IPv6 target scan for 3 snmp versions skips remaining probes after first success" {
    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --rate 1 \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        -vvv \
        --output-show all \
        --fast-port-status \
        --range 2480:db8:1:7::00a1

    assert_line_count --partial 1 "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp]"
    assert_line_count --regexp 1 "Discovered (open|closed) port 161/udp on 2480:db8:1:7::a1"
}
