describe "semver_check"

. ./lib-semver.sh

it_exits_0_for_a_valid_version() {
  semver_check "0.1.2"
}

it_exits_non_0_for_an_invalid_version() {
  ! semver_check "0.x.1"
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

describe "semver_parse"

it_parses_a_valid_version() {
  local VERSION=`semver_parse "0.1.2"`
  test $? = 0 && test "$VERSION" = "0 1 2"
}

it_exits_non_0_for_an_invalid_version() {
  ! semver_parse "0.x.1"
}

it_handles_multi_digxit_elements() {
  local VERSION=`semver_parse "12.36.24"`
  test $? = 0 && test "$VERSION" = "12 36 24"
}

it_handels_a_prerelease() {
  local VERSION=`semver_parse "0.0.1-alpha.1"`
  test $? = 0 && test "$VERSION" = "0 0 1 alpha.1"
}


it_handels_another_prerelease() {
  local VERSION=`semver_parse "0.0.1-alpha.123.foo.1"`
  test $? = 0 && test "$VERSION" = "0 0 1 alpha.123.foo.1
  "
}

xit_fails_for_invalid_prereleases() {
  ! local VERSION=`semver_parse "0.0.1-alpha_1"`
}

xit_fails_for_prereleases_with_empty_segments() {
  ! local VERSION=`semver_parse "0.0.1-alpha..1"`
}

xit_fails_for_prereleases_ending_with_a_dot() {
  ! local VERSION=`semver_parse "0.0.1-alpha..1"`
}

xit_handels_build_metadata() {
  local VERSION=`semver_parse "1.2.444+alsdj.456"`
}

xit_fails_for_invalid_metadata() {
  ! local VERSION=`semver_parse "0.0.1+alpha_1"`
}

xit_fails_for_metadata_with_empty_segments() {
  ! local VERSION=`semver_parse "0.0.1+alpha..1"`
}

xit_fails_for_metadata_ending_with_a_dot() {
  ! local VERSION=`semver_parse "0.0.1+alpha..1"`
}

xit_succeeds_for_prerelease_versions_with_metadata() {
  local VERSION=`semver_parse "123.456.789-rc.92+2032-04-11"`
}
