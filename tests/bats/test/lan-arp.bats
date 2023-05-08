bats_require_minimum_version 1.5.0

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/common-masscan'
}

# bats test_tags: arp ipv4 lan
@test "LAN ipv4 target is not scanned when OS cache is empty and ARP probe is not requested" {
    skip
    neigh_flush

    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v3 \
        --banners \
        --lan-arp-retries 2 \
-vvv \
--packet-trace \
        10.9.0.161

#    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v3]"
    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v1]"
}

# bats test_tags: arp ipv4 lan
@test "LAN ipv4 target is scanned when OS cache is empty and ARP probe is requested" {
    skip
    neigh_flush

    run \
      masscan \
        -pU:161 \
        --wait 2 \
        --snmp-v3 \
        --banners \
        --lan-arp-retries 2 \
        --with-lan-arp \
        10.9.0.161

    assert_output --partial "Banner on port 161/udp on 10.9.0.161: [snmp] [v3]"
}
