bats_require_minimum_version 1.5.0

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/common-masscan'
    load 'test_helper/common-assert'
}

# bats file_tags= tcp, lan

# bats test_tags= ipv4
@test "Can scan single default LAN IPv4 target for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.9.0.161

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.161"
}

# bats test_tags= ipv4
@test "Can scan two default LAN IPv4 targets for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.9.0.161 10.9.0.163

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.161"

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.163"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.163"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.163"
}

# bats test_tags= ipv4
@test "Can scan range of default LAN IPv4 targets for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.9.0.128/25

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.161"

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.163"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.163"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.163"

    assert_line --partial "Discovered closed port 23/tcp on 10.9.0.165"
    assert_line --partial "Discovered closed port 135/tcp on 10.9.0.165"
    assert_line --partial "Discovered closed port 137/tcp on 10.9.0.165"
}

# bats test_tags= ipv6
@test "Can scan single default LAN IPv6 target for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:9::00a1

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a1"
}


# bats test_tags= ipv6
@test "Can scan two default LAN IPv6 targets for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:9::00a1 --range 2480:db8:1:9::00a3

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a1"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a3"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a3"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a3"
}

# bats test_tags= ipv6
@test "Can scan range of default LAN IPv6 targets for multiple TCP ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:9::0080/121

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a1"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a3"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a3"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a3"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:9::a5"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:9::a5"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:9::a5"
}
