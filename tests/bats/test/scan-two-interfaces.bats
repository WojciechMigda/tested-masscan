bats_require_minimum_version 1.5.0

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/common-masscan'
    load 'test_helper/common-assert'
}


# bats file_tags= ipv4, ipv6, network-multiplexing, lan, wan


# bats test_tags= snmp-v1, snmp-v2c, snmp-v3, udp, tcp, sctp, icmp
@test "Can scan range of default LAN and WAN IPv4 and IPv6 UDP targets for snmp v1, v2c, and v3, ICMP, SCTP, and TCP targets over two network interfaces" {
    run \
      masscan \
        -pU:161 \
        -p135,137 \
        -sZ \
        -p135,137 \
        --ping \
        --wait 2 \
        --output-show all \
        --snmp-v1 --snmp-v2c --snmp-v3 \
        --banners \
        10.7.0.128/25 \
        10.9.0.128/25 \
        --range 2480:db8:1:7::0080/121 \
        --range 2480:db8:1:9::0080/121 \
        --if[0] eth0 --if[1] eth0 \

    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.161: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.7.0.161"

    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.163: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.7.0.163"

    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.7.0.165: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.7.0.165"

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.9.0.161"

    assert_output --partial "Banner on port 161/udp on 10.9.0.163: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.163: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.163: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.9.0.163"

    assert_output --partial "Banner on port 161/udp on 10.9.0.165: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.165: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.165: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 10.9.0.165"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a1: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:7::a1"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a3: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:7::a3"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:7::a5: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:7::a5"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a1: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a1: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a1: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:9::a1"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a3: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:9::a3"

    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a5: [snmp] [v1]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a5: [snmp] [v2c]"
    assert_output --partial "Banner on port 161/udp on 2480:db8:1:9::a5: [snmp] [v3]"
    assert_line_count --partial 3 "Discovered open port 161/udp on 2480:db8:1:9::a5"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.7.0.161"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.7.0.161"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.7.0.163"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.7.0.163"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.7.0.165"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.7.0.165"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.9.0.161"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.9.0.161"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.9.0.163"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.9.0.163"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 10.9.0.165"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 10.9.0.165"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:7::a1"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:7::a1"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:7::a3"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:7::a3"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:7::a5"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:7::a5"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:9::a1"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:9::a1"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:9::a3"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:9::a3"

    assert_line --regexp "Discovered (open|closed) port 135/tcp on 2480:db8:1:9::a5"
    assert_line --regexp "Discovered (open|closed) port 137/tcp on 2480:db8:1:9::a5"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.7.0.161"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.7.0.161"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.7.0.163"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.7.0.163"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.7.0.165"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.7.0.165"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.9.0.161"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.9.0.161"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.9.0.163"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.9.0.163"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 10.9.0.165"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 10.9.0.165"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:7::a1"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:7::a1"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:7::a3"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:7::a3"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:7::a5"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:7::a5"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:9::a1"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:9::a1"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:9::a3"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:9::a3"

    assert_line --regexp "Discovered (open|closed) port 135/sctp on 2480:db8:1:9::a5"
    assert_line --regexp "Discovered (open|closed) port 137/sctp on 2480:db8:1:9::a5"

    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.7.0.161"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.7.0.163"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.7.0.165"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.9.0.161"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.9.0.163"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 10.9.0.165"

    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:7::a1"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:7::a3"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:7::a5"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:9::a1"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:9::a3"
    assert_line --regexp "Discovered (open|closed) port 0/icmp on 2480:db8:1:9::a5"
}
