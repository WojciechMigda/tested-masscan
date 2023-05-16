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

# bats file_tags= tcp, wan

# bats test_tags= ipv4
@test "Can scan single default WAN IPv4 target for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.7.0.161

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.161"
}

# bats test_tags= ipv4
@test "Can scan two default WAN IPv4 targets for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.7.0.161 10.7.0.163

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.161"

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.163"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.163"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.163"
}

# bats test_tags= ipv4
@test "Can scan range of default WAN IPv4 targets for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        10.7.0.128/25

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.161"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.161"

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.163"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.163"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.163"

    assert_line --partial "Discovered closed port 23/tcp on 10.7.0.165"
    assert_line --partial "Discovered closed port 135/tcp on 10.7.0.165"
    assert_line --partial "Discovered closed port 137/tcp on 10.7.0.165"
}

# bats test_tags= ipv6
@test "Can scan single default WAN IPv6 target for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:7::00a1

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a1"
}


# bats test_tags= ipv6
@test "Can scan two default WAN IPv6 targets for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:7::00a1 --range 2480:db8:1:7::00a3

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a1"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a3"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a3"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a3"
}

# bats test_tags= ipv6
@test "Can scan range of default WAN IPv6 targets for multiple tcp ports" {
    run \
      masscan \
        -p23,135,137 \
        --output-show all \
        --wait 2 \
        --range 2480:db8:1:7::0080/121

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a1"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a1"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a3"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a3"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a3"

    assert_line --partial "Discovered closed port 23/tcp on 2480:db8:1:7::a5"
    assert_line --partial "Discovered closed port 135/tcp on 2480:db8:1:7::a5"
    assert_line --partial "Discovered closed port 137/tcp on 2480:db8:1:7::a5"
}
