describe "semver_is_prerelease"

. ./lib-semver.sh

it_succeeds_for_a_prerelease() {
  semver_is_prerelease "1.2.3-alpha"
}

it_fails_for_a_stable_release() {
  ! semver_is_prerelease "12.13.14"
}

it_succeeds_for_a_prerelease_with_metadata() {
  semver_is_prerelease "1.2.3-alpha+1327983"
}
