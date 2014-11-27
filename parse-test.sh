describe "semver_parse"

. ./lib-semver.sh

it_parses_a_valid_version() {
  local VERSION=`semver_parse "0.1.2"`
  test $? = 0 && test "$VERSION" = "0 1 2 _ _"
}

it_exits_non_0_for_an_invalid_version() {
  ! semver_parse "0.x.1"
}

it_handles_multi_digxit_elements() {
  local VERSION=`semver_parse "12.36.24"`
  test $? = 0 && test "$VERSION" = "12 36 24 _ _"
}

it_handels_a_prerelease() {
  local VERSION=`semver_parse "0.0.1-alpha.1"`
  test $? = 0 && test "$VERSION" = "0 0 1 alpha.1 _"
}


it_handels_another_prerelease() {
  local VERSION=`semver_parse "0.0.1-alpha.123.foo.1"`
  test $? = 0 && test "$VERSION" = "0 0 1 alpha.123.foo.1 _"
}

it_fails_for_invalid_prereleases() {
  ! semver_parse "0.0.1-alpha_1"
}

it_fails_for_prereleases_with_empty_segments() {
  ! semver_parse "0.0.1-alpha..1"
}

it_fails_for_prereleases_ending_with_a_dot() {
  ! semver_parse "0.0.1-alpha..1"
}

it_handels_build_metadata() {
  local VERSION=`semver_parse "1.2.444+alsdj.456"`
  test $? && test "$VERSION" = "1 2 444 _ alsdj.456"
}

it_fails_for_invalid_metadata() {
  ! semver_parse "0.0.1+alpha_1"
}

it_fails_for_metadata_with_empty_segments() {
  ! semver_parse "0.0.1+alpha..1"
}

it_fails_for_metadata_ending_with_a_dot() {
  ! semver_parse "0.0.1+alpha..1"
}

it_succeeds_for_prerelease_versions_with_metadata() {
  local VERSION=`semver_parse "123.456.789-rc.92+2032-04-11"`
  test $? && test "$VERSION" = "123 456 789 rc.92 2032-04-11"
}
