#!/usr/bin/env bats

@test "Startpage response code equals 200" {
    run docker exec webproject curl -s -o /dev/null \
    -w "%{http_code}" localhost:8888
    echo "$output"
    [[ $output == 200 ]]
}