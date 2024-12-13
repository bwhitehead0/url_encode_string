#!/usr/bin/env bats

@test "URL encoding test for simple string" {
  result="$(./assets/url_encode_string.sh "hello world")"
  [ "$result" = "hello%20world" ]
}

@test "URL encoding test for special characters" {
  result="$(./assets/url_encode_string.sh "hello@world!")"
  [ "$result" = "hello%40world%21" ]
}

@test "URL encoding test for empty string" {
  result="$(./assets/url_encode_string.sh "")"
  [ "$result" = "" ]
}

@test "URL encoding test for multiple spaces" {
  result="$(./assets/url_encode_string.sh "hello    world")"
  [ "$result" = "hello%20%20%20%20world" ]
}

@test "URL encoding test for reserved characters" {
  result="$(./assets/url_encode_string.sh "hello?world#test")"
  [ "$result" = "hello%3Fworld%23test" ]
}

@test "URL encoding test with no parameters" {
  run ./assets/url_encode_string.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: ./assets/url_encode_string.sh <string>" ]
}

@test "URL encoding test with more than one parameter" {
  run ./assets/url_encode_string.sh "hello" "world"
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: ./assets/url_encode_string.sh <string>" ]
}