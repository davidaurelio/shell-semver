describe "semver_compare"

. "./lib-semver.sh"

get_status() {
  set +e
  $@
  echo $?
}

it_succeeds_for_identical_simple_versions() {
  semver_compare "1.2.322" "1.2.322"
}

it_fails_with_code_2_if_the_first_version_is_invalid() {
  test 2 = `get_status semver_compare "invalid" "1.2.3-beta+bar"`
}

it_fails_with_code_2_if_the_second_version_is_invalid() {
  test 2 = `get_status semver_compare "1.2.3-beta+bar" "invalid"`
}

it_fails_with_code_2_if_only_one_argument_has_been_provided() {
  test 2 = `get_status semver_compare invalid`
}

it_fails_with_code_2_if_two_invalid_arguments_have_been_provided() {
  test 2 = `get_status semver_compare invalid invalid`
}

it_fails_with_code_1_for_greater_major_versions() {
  test 1 = `get_status semver_compare 2.0.0 1.0.0`
}

it_fails_with_code_1_for_greater_minor_versions() {
  test 1 = `get_status semver_compare 1.1.0 1.0.0`
}
