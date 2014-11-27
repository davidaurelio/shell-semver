describe "semver_check"

. ./lib-semver.sh

it_succeeds_for_a_valid_version() {
  semver_check "0.1.2"
}

it_fails_for_an_invalid_version() {
  ! semver_check "0.x.1"
}

it_fails_for_another_invalid_version() {
  ! semver_check invalid
}

it_handles_multi_digit_elements() {
  semver_check "12.36.24"
}

it_handels_a_prerelease() {
  semver_check "0.0.1-alpha.1"
}


it_handels_another_prerelease() {
  semver_check "0.0.1-alpha.123.foo.1"
}

it_fails_for_invalid_prereleases() {
  ! semver_check "0.0.1-alpha_1"
}

it_fails_for_prereleases_with_empty_segments() {
  ! semver_check "0.0.1-alpha..1"
}

it_fails_for_prereleases_ending_with_a_dot() {
  ! semver_check "0.0.1-alpha..1"
}

it_handels_build_metadata() {
  semver_check "1.2.444+alsdj.456"
}

it_fails_for_invalid_metadata() {
  ! semver_check "0.0.1+alpha_1"
}

it_fails_for_metadata_with_empty_segments() {
  ! semver_check "0.0.1+alpha..1"
}

it_fails_for_metadata_ending_with_a_dot() {
  ! semver_check "0.0.1+alpha..1"
}

it_succeeds_for_prerelease_versions_with_metadata() {
  semver_check "123.456.789-rc.92+2032-04-11"
}
